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
#import "ATCPatient.h"
#import "ATCStation.h"

@interface ATCAppDelegate()
@property (nonatomic,strong) ATCNetworkTest * tester;
@property (nonatomic,strong) NSMutableDictionary * networkDictionary;
//@property (nonatomic,strong) NSDate * lastNotification;
@end

@implementation ATCAppDelegate


-(void)runTests{
    _tester = [[ATCNetworkTest alloc]init];
    [_tester testLogin];
    
    ATCBeacon * sink =[ATCBeacon new];
    sink.iOSidentifier =@"SINK";
    NSString * estimote = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
    sink.identifier = estimote;
    sink.major = @46515;
    sink.minor = @14779;
    
    [_tester testProximityData:sink];
    
}


-(void)setUp{
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
	
    _beaconManager = [JMCBeaconManager new];
    _networkManager= [ATCBeaconNetworkUtilities new];
    _contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray * stations) {
        self.state.stations =stations;
        NSLog(@"\n\n\n____CURRENT STATIONS ____ %@  \n", self.state.stations);
    }];
     _state =[ATCState new];
   // [self runTests];
    
    
#warning I should update it from the cloud!
    NSMutableString * message =[NSMutableString new];
    __block  NSDate * date;
   // [self.contentManager parseData];

    NSDictionary * beacons = [self.contentManager getBeacons];
    __block NSInteger tempProximity = -1;
    
    if([_beaconManager isSupported:message]){
        //that will be patient
        
        __weak __typeof__(self) weakSelf = self;
        _beaconManager.beaconFound =^void(NSString * proximityID, int major, int minor, CLProximity proximity){
            __typeof__(self) strongSelf = weakSelf;
            if(strongSelf.state.session == 0) return;
            NSDate * now = [NSDate date];
            NSString *key =   [ATCBeacon hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [beacons objectForKey:key];
            [strongSelf.state registerProximity:beacon andProximity:proximity];
            
            strongSelf.state.stations = [strongSelf.contentManager contentForBeaconID:proximityID andMajor:@(major) andMinor:@(minor) proximity:proximity];
            
            //send data to content manager that figures out nearby stations
            [strongSelf.state logicFor:beacon];
            
            
            if(beacon.type == ksink)
            {
                [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:beacon.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
                    
                    tempProximity =proximity;
                }];
                return;
            }
            
            
            if([strongSelf sendProximityData:@(beacon.type) state:@(proximity) andDate:now pid:key]){
                [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:beacon.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
                    
                    //[[strongSelf beaconManager] saveLog:error.debugDescription];
                    tempProximity =proximity;
                }];
                date = now;
            }
        };
        __weak __typeof__(self) weakSelf2 = self;
        _beaconManager.regionEvent =^void(NSString * proximityID, int major, int minor, NSUInteger state){
            __typeof__(self) strongSelf = weakSelf2;
            NSString *key =   [ATCBeacon hashedBeacon:proximityID major:major minor:minor];
            
            if(state == CLRegionStateOutside||state==CLRegionStateUnknown){
                strongSelf.state.stations = [strongSelf.contentManager removeBeacon:key];
            }
            else{
                strongSelf.state.stations = [strongSelf.contentManager addBeacon:key];
            }
            
            if(strongSelf.state.session == 0) return;
            
            ATCBeacon * beacon = [beacons objectForKey:key];
            NSLog(@"Region Event %d, %d state (0 unknown, inside, outside): %d",major,minor, (int)state);
            
            [[strongSelf networkManager] sendRegionNotification:major minor:minor proximityID:beacon.identifier  regionState:state user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
            }];
            
            ATCStation * station = [strongSelf.contentManager.stationsCompleteDictionary objectForKey:key];
		//	strongSelf.ge
			
            [strongSelf.state registerRegionEvent:station andState:state];
			if(station!=nil) {
				assert(station.type == beacon.type);
	
			}
        };
    }
    else {
        NSLog(@"Message: %@ %s",message,__PRETTY_FUNCTION__);
    }
}


/** Checks if data should be sent */
-(BOOL)sendProximityData:(NSNumber*)type state:(NSNumber *)proximity andDate:(NSDate *)newDate pid:(NSString *)pid{
    
    NSDictionary * newDict = @{@"type":type, @"proximity":proximity, @"date":newDate};
    if([_networkDictionary objectForKey:pid]){
        NSDictionary * dict =[_networkDictionary objectForKey:pid];
        
        NSDate * date = [dict objectForKey:@"date"];
        NSInteger newState =[[dict objectForKey:@"proximity"]integerValue];
        NSInteger difference =[newDate timeIntervalSinceDate:date];
        
        if(difference > 8||proximity.integerValue != newState ){
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
    
    [self.state logout];
    
    //self.state log
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@" Notification Received ");
    
}


@end
