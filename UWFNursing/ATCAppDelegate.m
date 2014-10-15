//
//  ATCAppDelegate.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
// Copyright 2014 by The University of West Florida.  ALL RIGHTS RESERVED. All Web site design, text, graphics, the selection and arrangement thereof, and all software are property of the University of West Florida. Any use of materials on this website, including reproduction, modification, distribution or republication, without the prior written consent of the University is strictly prohibited.


#import "ATCAppDelegate.h"
#import "JMCBeaconManager.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCBeaconContentManager.h"
#import "ATCNetworkTest.h"
#import "ATCState.h"
#import "ATCBeacon.h"

@interface ATCAppDelegate()
@property (nonatomic,strong) ATCNetworkTest * tester;
@end

@implementation ATCAppDelegate


-(void)runTests{
    _tester = [[ATCNetworkTest alloc]init];
    [_tester testLogin];
    
}

-(NSString*)hashedBeacon:(NSString *)identifier major:(NSInteger)major minor:(NSInteger)minor{
  
    return [NSString stringWithFormat:@"%@%lu%lu",identifier,major,minor ];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _state =[ATCState new];
    _beaconManager = [JMCBeaconManager new];
    _networkManager= [ATCBeaconNetworkUtilities new];
    _contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray * patients) {
        self.patients = patients;
        NSLog(@"\n\n\n____CURRENT PATIENTS ____ %@  \n\n\n\n", self.patients);
    
    }];

    #warning TESTS
   // [self runTests];

    
    
//_contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray *){
//       
//      }];
    
   
    NSString * kontaktIo =@"f7826da6-4fa2-4e98-8024-bc5b71e0893e";
    NSString * estimote = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
    
    __block NSDate * date = [NSDate new];
    NSMutableString * message =[NSMutableString new];
    
    
        ATCBeacon * sink =[ATCBeacon new];
        sink.iOSidentifier =@"SINK";
        sink.identifier = kontaktIo;
        sink.major = @33690;
        sink.minor = @9767;
    
        ATCBeacon * room =[ATCBeacon new];
        room.iOSidentifier = @"room";
        room.identifier =kontaktIo;
        room.major =@6914;
        room.minor = @5919;
    
        ATCBeacon * bed =[ATCBeacon new];
        bed.iOSidentifier = @"room";
        bed.identifier =kontaktIo;
        bed.major =@43332;
        bed.minor = @62552;
    
        ATCBeacon * debriefingRoom =[ATCBeacon new];
        debriefingRoom.iOSidentifier = @"Debriefing room";
        debriefingRoom.identifier = estimote;
        debriefingRoom.major =  @2984;
        debriefingRoom.minor =  @2;
    
    
        sink.type = ksink;
        room.type = kroom;
        bed.type = kbed;
        debriefingRoom.type =kbriefing;
    
        NSArray * beacons = @[room, sink, bed, debriefingRoom];
        NSMutableDictionary * dictionary =[@{}mutableCopy];
    
    
        if([_beaconManager isSupported:message]){
            //that will be patient
//            [_beaconManager registerRegionWithProximityId: andIdentifier:@"ATC PATIENT" major:1 andMinor:1];
//            
//            //that will be sink
//            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC SINK" major:2984 andMinor:2];
//            
//            //that will be room with patients
//            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC ROOM" major:2984 andMinor:111];
//            
//            //that will be room with patients
//            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC BRIEFING ROOM" major:29842 andMinor:1112];
           // NSDictionary * dict =
            for(ATCBeacon * beacon in beacons ){
                [_beaconManager registerRegionWithProximityId:beacon.identifier  andIdentifier:beacon.iOSidentifier    major:beacon.major.intValue   andMinor:beacon.major.intValue];
//                NSString * s =[NSString stringWithFormat:@"%@%@%@",beacon.identifier,beacon.major,beacon.minor ];
                NSString * key = [self hashedBeacon:beacon.identifier major:beacon.major.integerValue minor:beacon.minor.integerValue];
        
                [dictionary setObject:beacon forKey:key];
                
            }

           __weak __typeof__(self) weakSelf = self;
            
            _beaconManager.beaconFound =^void(NSString * proximityID, int major, int minor, CLProximity proximity){
               __typeof__(self) strongSelf = weakSelf;
                NSDate * now = [NSDate date];
                NSTimeInterval interval = [now  timeIntervalSinceDate:date];
            
                
            NSString *key =   [strongSelf hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
            if(beacon){
                switch (beacon.type) {
                    case kbed:
                        [strongSelf.state registerPatientProximityEvent:proximity];
                        break;
                    case kroom:
                        [strongSelf.state registerRoomProximityEvent:proximity];
                        break;
                    case ksink:
                         [strongSelf.state registerSinkProximityEvent:proximity];
                        break;
                    case kbriefing:
//                         [strongSelf.state registerRoomProximityEvent:proximity];
                        break;
                    default:
                        break;
                }
                
            }
                
#warning cheating here?
             strongSelf.patients =   [strongSelf.contentManager contentForBeaconID:room.identifier  andMajor:room.major    andMinor:room.minor proximity:proximity];
                
                
                if(interval>10){
                    [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:room.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
                        
                        [[strongSelf beaconManager] saveLog:error.debugDescription];
                    
                    }];
                }
                
                date = now;
            };
             __weak __typeof__(self) weakSelf2 = self;
            _beaconManager.regionEvent =^void(NSString * proximityID, int major, int minor, NSUInteger state){
                 __typeof__(self) strongSelf = weakSelf2;
                
                NSString *key =   [strongSelf hashedBeacon:proximityID major:major minor:minor];
                ATCBeacon * beacon = [dictionary objectForKey:key];

                [[strongSelf networkManager] sendRegionNotification:major minor:minor proximityID:beacon.identifier  regionState:state user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
                        [[strongSelf beaconManager] saveLog:error.debugDescription];
                    }];
            
               
                             if(beacon){
                    switch (beacon.type) {
                        case kbed:
                             [strongSelf.state registerPatientRegionEvent:state];
                            
                            break;
                        case kroom:
                             [strongSelf.state registerRoomRegionEvent:state];
                             if(state == CLRegionStateOutside||state == CLRegionStateUnknown){
                                [strongSelf.contentManager removeAll];
                             }
                            
                            break;
                        case ksink:
                              [strongSelf.state registerSinkRegionEvent:state];
                            break;
                        case kbriefing:
                            
                            break;
                        default:
                            break;
                    }

                }
            };
        }
        else {
            NSLog(@"Message: %@ %s",message,__PRETTY_FUNCTION__);
        }
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
     [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@" Notification Received ");
    
}


@end
