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




-(void)parseData:(ATCBeacon *)_bed{
    ATCPatient * p1 = [[ATCPatient alloc]init];
    p1.name = @"Skyler";
    p1.lastname=@"Jansen";
    p1.dob =  @"3/11/xx";
    p1.pid = @"MR PCS33300";
    
    ATCPatient * p2 = [ATCPatient new];
    p2.name = @"Skylar";
    p2.lastname=@"Hansen";
    p2.dob =  @"3/11/xx";
    p2.pid = @"MR PCS31100";
    p2.wristbandCode = @"036000291452";
    p2.displayStartDate=@1415404800;
    p2.displayStopDate= @1446940800;
    p2.type = kbed;
    
    ATCPatient * p3 = [ATCPatient new];
    p3.name = @"Baby Boy";
    p3.lastname=@"Jones";
    p3.dob =  @"5 days ago";
    p3.pid = @"MR# MJ1";
    p3.wristbandCode = @"1234567890128";
    p3.displayStartDate =@1414779895;
    p3.displayStopDate = @1415404800;
    p3.type = kbed;
    
    ATCPatient * p4 = [ATCPatient new];
    p4.name = @"Jennie";
    p4.lastname=@"Jones";
    p4.dob =  @"1/1/xx";
    p4.pid = @"J123";
    p4.wristbandCode = @"5012345678900";
    p4.displayStartDate =@1414779895;
    p4.displayStopDate = @1415404800;
    p4.type = kbed;
    
    NSString * kontaktIo =@"f7826da6-4fa2-4e98-8024-bc5b71e0893e";
    NSString * estimote = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
    
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
    
    ATCBeacon * bed2 =[ATCBeacon new];
    bed2.iOSidentifier = @"bed_right";
    bed2.identifier =estimote;
    bed2.major =@1;
    bed2.minor = @4;
    bed2.type = kbed;
    
    ATCBeacon * debriefingRoom =[ATCBeacon new];
    debriefingRoom.iOSidentifier = @"Debriefing room";
    debriefingRoom.identifier = estimote;
    debriefingRoom.major =  @1;
    debriefingRoom.minor =  @3;
    
    sink.type = ksink;
    room.type = kroom;
    bed.type = kbed;
    debriefingRoom.type =kbriefing;
    
    
    ATCStation * bedStation = [ATCStation new];
    bedStation.beaconKey = bed.hashedBeacon;
    bedStation.icon = [UIImage imageNamed:@"patient"];
    bedStation.data = @{@"patient":p3};
    bedStation.title = [NSString stringWithFormat:@"%@ %@",p3.name, p3.lastname];
    bedStation.image = [UIImage imageNamed:@"bedside"];
    bedStation.vcname = @"ATCBedStationViewController";
    
    ATCStation * bedStation2 = [ATCStation new];
    bedStation2.beaconKey = bed2.hashedBeacon;
    bedStation2.icon = [UIImage imageNamed:@"patient"];
    bedStation2.data = @{@"patient":p4};
    bedStation2.title = [NSString stringWithFormat:@"%@ %@",p4.name, p4.lastname];
    bedStation2.image =[UIImage imageNamed:@"bedside"];
    bedStation2.vcname = @"ATCBedStationViewController";
    
    ATCStation * sinkStation = [ATCStation new];
    sinkStation.beaconKey =sink.hashedBeacon;
    sinkStation.icon = [UIImage imageNamed:@"sink_station"];
    sinkStation.title = @"Sink";
    sinkStation.vcname=@"ATCStationViewController";
    
    ATCStation * simLabStation = [ATCStation new];
    simLabStation.beaconKey = room.hashedBeacon;
    simLabStation.icon = [UIImage imageNamed:@""];
    simLabStation.title = @"Sim Lab";
    simLabStation.image = [UIImage imageNamed:@"simlab"];
    simLabStation.vcname = @"ATCHospitalRoomViewController";
    
    
    ATCStation * debriefingRoomStation= [ATCStation new];
    debriefingRoomStation.beaconKey = debriefingRoom.hashedBeacon;
    debriefingRoomStation.icon = [UIImage imageNamed:@""];
    debriefingRoomStation.title = @"Debriefing Room";
    debriefingRoomStation.image = [UIImage imageNamed:@"briefing_room"];
    debriefingRoomStation.vcname = @"ATCStationViewController";
    
    
    NSDictionary * appData = @{@"stations":@[bedStation, bedStation2, sinkStation,simLabStation,debriefingRoomStation]};
    NSString * b1key = [ATCBeacon hashedBeacon:bed.identifier major:bed.major.integerValue minor:bed.minor.integerValue];
    NSDictionary * data = @{b1key:@{@"type":@(kbed), @"patients":@[p2,p3,p4]}};
    _contentManager.data = data;

    
    
    
}

-(void)setUp{
    _state =[ATCState new];
    _beaconManager = [JMCBeaconManager new];
    _networkManager= [ATCBeaconNetworkUtilities new];
    _contentManager = [[ATCBeaconContentManager alloc]initWithCompletion:^(NSArray * patients) {
        self.state.stations = patients;
        NSLog(@"\n\n\n____CURRENT PATIENTS ____ %@  \n", self.state.stations);
    }];
#warning I should update it from the cloud!
    
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
    
    ATCBeacon * bed2 =[ATCBeacon new];
    bed2.iOSidentifier = @"bed_right";
    bed2.identifier =estimote;
    bed2.major =@1;
    bed2.minor = @4;
    bed2.type = kbed;
    
    ATCBeacon * debriefingRoom =[ATCBeacon new];
    debriefingRoom.iOSidentifier = @"Debriefing room";
    debriefingRoom.identifier = estimote;
    debriefingRoom.major =  @1;
    debriefingRoom.minor =  @3;
    
    sink.type = ksink;
    room.type = kroom;
    bed.type = kbed;
    debriefingRoom.type =kbriefing;

    [self parseData:room];
    
    NSArray * beacons = @[room, sink, bed, bed2, debriefingRoom];
    
    NSMutableDictionary * dictionary =[@{}mutableCopy];
   __block NSInteger tempProximity = -1;

    
    if([_beaconManager isSupported:message]){
        //that will be patient
        
        for(ATCBeacon * beacon in beacons ){
            [_beaconManager registerRegionWithProximityId:beacon.identifier  andIdentifier:beacon.iOSidentifier    major:beacon.major.intValue   andMinor:beacon.minor.intValue];
            NSString * key = [ATCBeacon hashedBeacon:beacon.identifier major:beacon.major.integerValue minor:beacon.minor.integerValue];
            
            [dictionary setObject:beacon forKey:key];
        }
        
        __weak __typeof__(self) weakSelf = self;
        
        _beaconManager.beaconFound =^void(NSString * proximityID, int major, int minor, CLProximity proximity){
            __typeof__(self) strongSelf = weakSelf;
            
            NSDate * now = [NSDate date];
            NSString *key =   [ATCBeacon hashedBeacon:proximityID major:major minor:minor];
            ATCBeacon * beacon = [dictionary objectForKey:key];
            [strongSelf.state registerProximity:beacon andProximity:proximity];
            
            [strongSelf.state logicFor:beacon];
            
            if([strongSelf sendProximityData:@(beacon.type) state:@(proximity) andDate:now pid:key]){

                [[strongSelf networkManager] sendProximityDataForBeacon:major minor:minor proximityID:beacon.identifier  proximity:proximity user:[NSString stringWithFormat:@"%ld", (long)strongSelf.state.user] withErrorCompletionHandler:^(NSError *error) {
                    
                    [[strongSelf beaconManager] saveLog:error.debugDescription];
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
            
            [strongSelf.state registerRegionEvent:beacon andState:state];

                        
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
