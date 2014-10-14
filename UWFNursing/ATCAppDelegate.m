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

@interface ATCAppDelegate()
@property (nonatomic,strong) ATCNetworkTest * tester;
@end

@implementation ATCAppDelegate


-(void)runTests{
    _tester = [[ATCNetworkTest alloc]init];
    [_tester testLogin];
    
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
    
   
    __block NSDate * date = [NSDate new];
    NSMutableString * message =[NSMutableString new];

    
        if([_beaconManager isSupported:message]){
            //that will be patient
            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC BEACON" major:1 andMinor:1];
            
            //that will be sink
            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC SINK" major:2984 andMinor:1];
            
            //that will be room with patients
            [_beaconManager registerRegionWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC ROOM" major:2984 andMinor:1];
            
      
           __weak __typeof__(self) weakSelf = self;
            
            _beaconManager.beaconFound =^void(int major, int minor, CLProximity proximity){
               __typeof__(self) strongSelf = weakSelf;
                NSDate * now = [NSDate date];
                NSTimeInterval interval = [now  timeIntervalSinceDate:date];
                
             strongSelf.patients =   [strongSelf.contentManager contentForBeaconID:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andMajor:@(major) andMinor:@(minor) proximity:proximity];
                
                
                if(interval>30){
                    [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
                    [[strongSelf beaconManager] saveLog:error.debugDescription];
                    }];
                }
                
                date = now;
            };
             __weak __typeof__(self) weakSelf2 = self;
            _beaconManager.regionEvent =^void(int major, int minor, NSUInteger state){
                 __typeof__(self) strongSelf = weakSelf2;
                
                        [[strongSelf networkManager] sendRegionNotification:major minor:minor proximityID:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"  regionState:state user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.nurse] withErrorCompletionHandler:^(NSError *error) {
                        [[strongSelf beaconManager] saveLog:error.debugDescription];
                    }];
            
                if(state == CLRegionStateOutside||state == CLRegionStateUnknown){
                    [strongSelf.contentManager removeAll];
                
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
