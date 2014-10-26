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
@property (nonatomic,strong) NSMutableDictionary * networkDictionary;
@end

@implementation ATCAppDelegate


-(void)runTests{
    _tester = [[ATCNetworkTest alloc]init];
    [_tester testLogin];
    
}

-(NSString*)hashedBeacon:(NSString *)identifier major:(NSInteger)major minor:(NSInteger)minor{
  
    return [NSString stringWithFormat:@"%@%lu%lu",[identifier lowercaseString],(long)major,(long)minor ];
}


-(void)setUp{
    _state =[ATCState new];
    _beaconManager = [JMCBeaconManager new];
    _networkManager= [ATCBeaconNetworkUtilities new];
    _contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray * patients) {
        self.patients = patients;
        NSLog(@"\n\n\n____CURRENT PATIENTS ____ %@  \n", self.patients);
        
    }];

    
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
    bed.iOSidentifier = @"bed";
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
   __block NSInteger tempProximity = -1;
    
    if([_beaconManager isSupported:message]){
        //that will be patient
        
        for(ATCBeacon * beacon in beacons ){
            [_beaconManager registerRegionWithProximityId:beacon.identifier  andIdentifier:beacon.iOSidentifier    major:beacon.major.intValue   andMinor:beacon.minor.intValue];
            NSString * key = [self hashedBeacon:beacon.identifier major:beacon.major.integerValue minor:beacon.minor.integerValue];
            
            [dictionary setObject:beacon forKey:key];
        }
        
        __weak __typeof__(self) weakSelf = self;
        
        _beaconManager.beaconFound =^void(NSString * proximityID, int major, int minor, CLProximity proximity){
            __typeof__(self) strongSelf = weakSelf;
          //  if(strongSelf.state.session == 0) return;
            
            NSDate * now = [NSDate date];
            NSString *key =   [strongSelf hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
            
            [strongSelf.state logicFor:beacon];
            
            if(beacon){
                switch (beacon.type) {
                    case kbed:{
                        [strongSelf.state registerPatientProximityEvent:proximity];
                        
                        break;}
                    case kroom:{
                        [strongSelf.state registerRoomProximityEvent:proximity];
                        strongSelf.patients = [strongSelf.contentManager contentForBeaconID:room.identifier  andMajor:room.major    andMinor:room.minor proximity:proximity];
                        
                        break;}
                    case ksink:{
                        [strongSelf.state registerSinkProximityEvent:proximity];
                        
                        
                        break;}
                    case kbriefing:{
                        [strongSelf.state registerBriefingRoomProximityEvent:proximity];
                        break;}
                    default:
                        break;
                }
                
            }

            if([strongSelf sendData:@(beacon.type) state:@(proximity) andDate:now pid:key]){

                [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:room.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
                    
                    [[strongSelf beaconManager] saveLog:error.debugDescription];
                    tempProximity =proximity;
                }];
                date = now;
            }            
            
        };
        __weak __typeof__(self) weakSelf2 = self;
        _beaconManager.regionEvent =^void(NSString * proximityID, int major, int minor, NSUInteger state){
            __typeof__(self) strongSelf = weakSelf2;
            
           // if(strongSelf.state.session == 0) return;
            NSString *key =   [strongSelf hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
   
            NSLog(@"Region Event %d, %d state (0 unknown, inside, outside): %d",major,minor, (int)state);
         
            
            [[strongSelf networkManager] sendRegionNotification:major minor:minor proximityID:beacon.identifier  regionState:state user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
            }];
            BOOL sent = FALSE;
                switch (beacon.type) {
                    case kbed:{
                        [strongSelf.state registerPatientRegionEvent:state];
                        sent = YES;
                        break;}
                    case kroom:{
                        [strongSelf.state registerRoomRegionEvent:state];
                        if(state == CLRegionStateOutside||state == CLRegionStateUnknown){
                            [strongSelf.contentManager removeAll];
                        }
                        sent = YES;
                        break;}
                    case ksink:{
                        [strongSelf.state registerSinkRegionEvent:state];
                        sent = YES;
                        break;}
                    case kbriefing:{
                        sent = YES;
                        [strongSelf.state registerBriefingRoomRegionEvent:state];
                        break;
                    }
                    default:
                        break;
                }
            
            UILocalNotification * notif = [[UILocalNotification alloc]init];
            notif.alertBody = [NSString stringWithFormat:@"Region Notification: (0 unknown, inside, outside) maj %d min %d state: %d",major,minor,(int)state];
            
            [[UIApplication sharedApplication] presentLocalNotificationNow:notif];
            
            
        };
    }
    else {
        NSLog(@"Message: %@ %s",message,__PRETTY_FUNCTION__);
    }

}

-(BOOL)sendData:(NSNumber*)type state:(NSNumber *)state andDate:(NSDate *)newDate pid:(NSString *)pid{
    
     NSDictionary * newDict = @{@"type":type, @"proximity":state, @"date":newDate};
    if([_networkDictionary objectForKey:pid]){
        NSDictionary * dict =[_networkDictionary objectForKey:pid];

        NSDate * date = [dict objectForKey:@"date"];
        NSInteger newState =[[dict objectForKey:@"proximity"]integerValue];
        NSInteger difference =[newDate timeIntervalSinceDate:date];
       
        if(difference > 10||state.integerValue != newState ){
             [_networkDictionary setObject:newDict forKey:pid];
            return  YES;
        }
    }
    else{
       
        [_networkDictionary setObject:newDict forKey:pid];
        return YES;
    }
    
    return NO;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    #warning TESTS
   // [self runTests];
    _networkDictionary = [NSMutableDictionary new];
    [self setUp];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
    }

    
   
  
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    // [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     //[_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    // [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   //  [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // [_beaconManager saveLog:[NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__]];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@" Notification Received ");
    
}


@end
