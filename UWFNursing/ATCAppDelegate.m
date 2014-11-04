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
    
}




-(NSDictionary *)parseData{
    ATCPatient * p1 = [[ATCPatient alloc]init];
    p1.name = @"Skyler";
    p1.lastname=@"Jansen";
    p1.dob =  @"3/11/xx";
    p1.pid = @"MR PCS33300";
    
    NSString * kontaktIo =@"f7826da6-4fa2-4e98-8024-bc5b71e0893e";
    NSString * estimote = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
    
    ATCBeacon * sink =[ATCBeacon new];
    sink.iOSidentifier =@"SINK";
    sink.identifier = estimote;
    sink.major = @46515;
    sink.minor = @14779;
    
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
    
    ATCBeacon * bed2 =[ATCBeacon new];
    bed2.iOSidentifier = @"bed_right";
    bed2.identifier =estimote;
    bed2.major =@30412;
    bed2.minor = @5559;
  
    
    ATCBeacon * debriefingRoom =[ATCBeacon new];
    debriefingRoom.iOSidentifier = @"Debriefing room";
    debriefingRoom.identifier = estimote;
    debriefingRoom.major =  @10229;
    debriefingRoom.minor =  @12626;
    
    sink.type = ksink;
    room.type = kroom;
    bed.type = kbed;
    debriefingRoom.type =kbriefing;
      bed2.type = kbed;
    
    ATCPatient * p2 = [ATCPatient new];
    p2.name = @"Skylar";
    p2.lastname=@"Hansen";
    p2.dob =  @"3/11/xx";
    p2.pid = @"MR PCS31100";
    p2.wristbandCode = @"036000291452";
    p2.displayStartDate=@1415404800;
    p2.displayStopDate= @1446940800;
    p2.type = kbed;
    p2.beaconKey = bed.hashedBeacon;
    p2.icon = [UIImage imageNamed:@"patient"];

    p2.title = [NSString stringWithFormat:@"%@ %@",p2.name, p2.lastname];
    p2.image = [UIImage imageNamed:@"bedside"];
    p2.vcname = @"ATCPatientViewController";
    
    ATCPatient * bedStation = [ATCPatient new];
    bedStation.name = @"Baby Boy";
    bedStation.lastname=@"Jones";
    bedStation.dob =  @"5 days ago";
    bedStation.pid = @"MR# MJ1";
    bedStation.wristbandCode = @"1234567890128";
    bedStation.displayStartDate =@1414779895;
    bedStation.displayStopDate = @1415404800;
    bedStation.type = kbed;
    bedStation.beaconKey =bed.hashedBeacon;
    bedStation.icon = [UIImage imageNamed:@"patient"];
    bedStation.title = [NSString stringWithFormat:@"%@ %@",bedStation.name, bedStation.lastname];
    bedStation.image = [UIImage imageNamed:@"bedside"];
    bedStation.vcname = @"ATCPatientViewController";
    
    
    ATCPatient * bedStation3 = [ATCPatient new];
    bedStation3.name = @"Jennie";
    bedStation3.lastname=@"Jones";
    bedStation3.dob =  @"1/1/xx";
    bedStation3.pid = @"J123";
    bedStation3.wristbandCode = @"5012345678900";
    bedStation3.displayStartDate =@1414779895;
    bedStation3.displayStopDate = @1415404800;
    bedStation3.type = kbed;
    bedStation3.beaconKey = bed2.hashedBeacon;
    bedStation3.icon = [UIImage imageNamed:@"patient"];
    bedStation3.title = [NSString stringWithFormat:@"%@ %@",bedStation3.name, bedStation3.lastname];
    bedStation3.image =[UIImage imageNamed:@"bedside"];
    bedStation3.vcname = @"ATCPatientViewController";
    
    NSDate * past = [NSDate distantPast];
    NSDate * future = [NSDate distantFuture];
    
    ATCStation * sinkStation = [ATCStation new];
    sinkStation.beaconKey =sink.hashedBeacon;
    sinkStation.icon = [UIImage imageNamed:@"sink_icon"];
    sinkStation.image =[UIImage imageNamed:@"sink"];
    sinkStation.title = @"Sink";
    sinkStation.vcname=@"ATCStationViewController";
    sinkStation.displayStopDate =@([future timeIntervalSince1970]);
    sinkStation.displayStartDate =@([past timeIntervalSince1970]);
    sinkStation.type = ksink;
    
    ATCStation * simLabStation = [ATCStation new];
    simLabStation.beaconKey = room.hashedBeacon;
    simLabStation.icon = [UIImage imageNamed:@""];
    simLabStation.title = @"Sim Lab";
    simLabStation.image = [UIImage imageNamed:@"simlab"];
    simLabStation.vcname = @"ATCHospitalRoomViewController";
    simLabStation.displayStopDate =@([future timeIntervalSince1970]);
    simLabStation.displayStartDate =@([past timeIntervalSince1970]);
    simLabStation.data =@{@"patients":@[bedStation,bedStation3]};
    simLabStation.type=kroom;
    
    ATCStation * debriefingRoomStation= [ATCStation new];
    debriefingRoomStation.beaconKey = debriefingRoom.hashedBeacon;
    debriefingRoomStation.icon = [UIImage imageNamed:@""];
    debriefingRoomStation.title = @"Debriefing Room";
    debriefingRoomStation.image = [UIImage imageNamed:@"briefing_room"];
    debriefingRoomStation.vcname = @"ATCStationViewController";
    debriefingRoomStation.displayStopDate =@([future timeIntervalSince1970]);
    debriefingRoomStation.displayStartDate =@([past timeIntervalSince1970]);
    debriefingRoom.type = kbriefing;
    
    NSDictionary * appData = @{@"stations":@[sinkStation,simLabStation,debriefingRoomStation,bedStation, bedStation3]};
    _contentManager.data = appData;
    NSArray * beacons = @[room, sink, bed, bed2, debriefingRoom];
    
    NSMutableDictionary * dictionary =[@{}mutableCopy];
    
    
    for(ATCBeacon * beacon in beacons ){
        [_beaconManager registerRegionWithProximityId:beacon.identifier  andIdentifier:beacon.iOSidentifier    major:beacon.major.intValue   andMinor:beacon.minor.intValue];
        NSString * key = [ATCBeacon hashedBeacon:beacon.identifier major:beacon.major.integerValue minor:beacon.minor.integerValue];
        
        [dictionary setObject:beacon forKey:key];
    }
    
    return dictionary;
}

-(void)setUp{
    _state =[ATCState new];
    _beaconManager = [JMCBeaconManager new];
    _networkManager= [ATCBeaconNetworkUtilities new];
    _contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray * stations) {
        self.state.stations =stations;
        NSLog(@"\n\n\n____CURRENT STATIONS ____ %@  \n", self.state.stations);
    }];
    
    

#warning I should update it from the cloud!
    NSMutableString * message =[NSMutableString new];
  __block  NSDate * date;
    NSMutableDictionary * dictionary = [[self parseData]mutableCopy];
   __block NSInteger tempProximity = -1;
    
    if([_beaconManager isSupported:message]){
        //that will be patient
        
        __weak __typeof__(self) weakSelf = self;
        _beaconManager.beaconFound =^void(NSString * proximityID, int major, int minor, CLProximity proximity){
            __typeof__(self) strongSelf = weakSelf;
            
            NSDate * now = [NSDate date];
            NSString *key =   [ATCBeacon hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
            [strongSelf.state registerProximity:beacon andProximity:proximity];
            
            strongSelf.state.stations = [strongSelf.contentManager contentForBeaconID:proximityID andMajor:@(major) andMinor:@(minor) proximity:proximity];
            
            //send data to content manager that figures out nearby stations
            [strongSelf.state logicFor:beacon];
            
            if([strongSelf sendProximityData:@(beacon.type) state:@(proximity) andDate:now pid:key]){
                [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:beacon.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
                    
                   // [[strongSelf beaconManager] saveLog:error.debugDescription];
                    tempProximity =proximity;
                }];
                date = now;
            }
        };
        __weak __typeof__(self) weakSelf2 = self;
        _beaconManager.regionEvent =^void(NSString * proximityID, int major, int minor, NSUInteger state){
            __typeof__(self) strongSelf = weakSelf2;
            if(strongSelf.state.session == 0) return;
            NSString *key =   [ATCBeacon hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
            NSLog(@"Region Event %d, %d state (0 unknown, inside, outside): %d",major,minor, (int)state);
            
            [[strongSelf networkManager] sendRegionNotification:major minor:minor proximityID:beacon.identifier  regionState:state user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
            }];
            
            ATCStation * station = [strongSelf.contentManager.stationsCompleteDictionary  objectForKey:key];
            
            
            [strongSelf.state registerRegionEvent:station andState:state];
            
        };
    }
    else {
        NSLog(@"Message: %@ %s",message,__PRETTY_FUNCTION__);
    }
}



/**Checks if data should be sent */
-(BOOL)sendProximityData:(NSNumber*)type state:(NSNumber *)state andDate:(NSDate *)newDate pid:(NSString *)pid{
    
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

    [self.state logout];
    
    //self.state log
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@" Notification Received ");
    
}


@end
