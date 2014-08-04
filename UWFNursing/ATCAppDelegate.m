//
//  ATCAppDelegate.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCAppDelegate.h"
#import "JMCBeaconManager.h"
#import "ATCBeaconNetworkUtilities.h"

@implementation ATCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
      _beaconManager = [JMCBeaconManager new];
        _networkManager= [ATCBeaconNetworkUtilities new];

    NSMutableString * message =[NSMutableString new];
    
        if([_beaconManager isSupported:message]){
            [_beaconManager registerBeaconWithProximityId:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D" andIdentifier:@"ATC BEACON" major:-1 andMinor:-1];
          
            _beaconManager.beaconFound =^void(int major, int minor, CLProximity proximity){
                
            };
            
            _beaconManager.regionEvent =^void(int major, int minor, BOOL entered){
                [_networkManager sendRegionNotification:major minor:minor proximityId:@"" regionEntered:entered user:@"Janek"];
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
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
