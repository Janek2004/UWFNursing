//
//  ATCBeaconContentManager.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/30/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATCBeacon.h"
#import "ATCPatient.h"
#import "ATCBeaconContentManager.h"


#define REFRESH_RATE 15

@interface ATCBeaconContentManager()
@property (nonatomic,copy) void (^stationsBlock)(NSArray *);
@property (nonatomic,strong) NSArray * stationsArray;


@end


@implementation ATCBeaconContentManager
//how to link ibeacons to content?
//when we entered the region

-(instancetype)init{
    if(self = [super init]){
        _stations = [NSMutableDictionary new];
        _stationsCompleteDictionary =[NSMutableDictionary new];
        [self parseData];
    }
    return self;
}

-(id)initWithCompletion:(void (^)(NSArray *))stationsBlock{
    self = [self init];
    if(self){
        self.stationsBlock = [stationsBlock copy];
    }
    return self;
}

-(NSArray *)setNearbyBeacons:(NSArray*)beacons{
    
    NSMutableDictionary* keysLeft = self.stations.mutableCopy;
    for (CLBeacon * beacon in beacons){
        NSString * key = [ATCBeacon hashedBeacon:beacon.proximityUUID.UUIDString  major:beacon.major.integerValue minor:beacon.minor.integerValue];
        
        if(![self.stations objectForKey:key])
        {
            [self.stations setObject:[self.stationsCompleteDictionary objectForKey:key]  forKey:key];
        }
        else{
            [keysLeft removeObjectForKey:key];
        }
    }
    
    for(NSString * s in keysLeft.allKeys){
        [self.stations removeObjectForKey:s];
    }
    
    return self.stations.allValues;
    
}
/**Get Beacons */
-(NSDictionary *)getBeacons;{
	return [self.data objectForKey:@"beacons"];
}

/**Get Patients */
-(NSArray *)getPatients{
    return [self.data objectForKey:@"patients"];
}
/**
 Check beacons
 */
-(NSArray *)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)proximity{
    
    NSString *key =  [ATCBeacon hashedBeacon:beaconId major:major.integerValue minor:minor.integerValue];
    
    ATCStation * station =[self.stationsCompleteDictionary objectForKey:key];
    //    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    
    //if it doesn't exist we need to add it.
    if(![self.stations objectForKey:key]){
        if(proximity!=CLProximityUnknown){
            // if(station.displayStartDate.integerValue<timestamp&&station.displayStopDate.integerValue>timestamp){
            [self.stations setObject:station  forKey:key];
            // }
            
            // if(!station.displayStartDate.integerValue<timestamp&&!station.displayStopDate){
            //   [self.stations setObject:station  forKey:key];
            // }
        }
        return self.stations.allValues;
    }
    //it should exist but proximity is unknown. Therefore we need to remove it
    if(proximity == CLProximityUnknown){
        [self.stations removeObjectForKey:key];
        return self.stations.allValues;
    }
    
    
    //    //content is expired or not ready yet.
    //        if(station.displayStartDate.integerValue < timestamp&&!station.displayStopDate){
    //            [self.stations removeObjectForKey:key];
    //            return self.stations.allValues;
    //        }
    //other cases, simply display it and return the stations
    [self.stations setObject:station forKey:key];
    return self.stations.allValues;
}

-(NSArray *)removeBeacon:(NSString *)pid{
    [self.stations removeObjectForKey:pid];
    return self.stations.allValues;
}

-(NSArray *)addBeacon:(NSString *)pid{
    [self.stations removeObjectForKey:pid];
    return self.stations.allValues;
}

-(void)setData:(NSDictionary *)data{
    _data =data;
    NSArray *array = [data objectForKey:@"stations"];
    for(ATCStation * station in array){
        [self.stationsCompleteDictionary setObject:station forKey:station.beaconKey];
    }
    
}

-(NSDictionary *)parseData{
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
    
    
    
    ATCPatient * skylar = [ATCPatient new];
    skylar.name = @"Skylar";
    skylar.lastname=@"Hansen";
    skylar.dob =  @"3/11/xx";
    skylar.pid = @"MR PCS31100";
    skylar.wristbandCode = @"036000291452";
    skylar.displayStartDate=@1415404800;
    skylar.displayStopDate= @1446940800;
    skylar.type = kbed;
    skylar.beaconKey = bed.hashedBeacon;
    skylar.icon = [UIImage imageNamed:@"patient"];
    
    skylar.title = [NSString stringWithFormat:@"%@ %@",skylar.name, skylar.lastname];
    skylar.image = [UIImage imageNamed:@"bedside"];
    skylar.vcname = @"ATCPatientViewController";
    
    ATCPatient * jennie = [ATCPatient new];
    jennie.name = @"Jennie";
    jennie.lastname=@"Jones";
    jennie.dob =  @"1/1/xx";
    jennie.pid = @"J123";
    jennie.wristbandCode = @"5012345678900";
    jennie.displayStartDate =@1414779895;
    jennie.displayStopDate = @1415404800;
    jennie.type = kbed;
    jennie.beaconKey = bed.hashedBeacon;
    jennie.icon = [UIImage imageNamed:@"patient"];
    jennie.title = [NSString stringWithFormat:@"%@ %@",jennie.name, jennie.lastname];
    jennie.image =[UIImage imageNamed:@"bedside"];
    jennie.vcname = @"ATCPatientViewController";
	
    ATCPatient * vincent = [ATCPatient new];
    vincent.name = @"Vincent";
    vincent.lastname=@"Brody";
    vincent.dob =  @"06/28/XX";
    vincent.pid = @"PCS62800";
    vincent.wristbandCode = @"2";
    vincent.type = kbed;
    vincent.beaconKey =bed2.hashedBeacon;
    vincent.icon = [UIImage imageNamed:@"patient"];
    vincent.title = [NSString stringWithFormat:@"%@ %@",vincent.name, vincent.lastname];
    vincent.image = [UIImage imageNamed:@"bedside"];
    vincent.vcname = @"ATCPatientViewController";
    vincent.allergies  = @"NKA";
    
    ATCPatient * stan = [ATCPatient new];
    stan.name = @"Stan";
    stan.lastname=@"Checkets";
    stan.dob =  @"08/13/xx";
    stan.pid = @"PCS81300";
    stan.wristbandCode = @"3";
    stan.type = kbed;
    stan.beaconKey = bed.hashedBeacon;
    stan.icon = [UIImage imageNamed:@"patient"];
    stan.title = [NSString stringWithFormat:@"%@ %@",stan.name, stan.lastname];
    stan.image =[UIImage imageNamed:@"bedside"];
    stan.vcname = @"ATCPatientViewController";
    stan.allergies = @"Demerol";
    
    ATCPatient * gerard = [ATCPatient new];
    gerard.name = @"Gerard";
    gerard.lastname=@"Graham";
    gerard.dob =  @"03/17/XX";
    gerard.pid = @"GG1";
    gerard.wristbandCode = @"4";
    gerard.type = kbed;
    gerard.beaconKey = bed.hashedBeacon;
    gerard.icon = [UIImage imageNamed:@"patient"];
    gerard.title = [NSString stringWithFormat:@"%@ %@",gerard.name, gerard.lastname];
    gerard.image =[UIImage imageNamed:@"bedside"];
    gerard.vcname = @"ATCPatientViewController";
    gerard.allergies = @"NKA";
    
    ATCPatient * kathleen = [ATCPatient new];
    kathleen.name = @"Kathleen";
    kathleen.lastname=@"Kay";
    kathleen.dob =  @"01/01/XX";
    kathleen.pid = @"KK1";
    kathleen.wristbandCode = @"5";
    kathleen.type = kbed;
    kathleen.beaconKey = bed.hashedBeacon;
    kathleen.icon = [UIImage imageNamed:@"patient"];
    kathleen.title = [NSString stringWithFormat:@"%@ %@",kathleen.name, kathleen.lastname];
    kathleen.image =[UIImage imageNamed:@"bedside"];
    kathleen.vcname = @"ATCPatientViewController";
    kathleen.allergies = @"NKA";
    
    ATCPatient * jennifer = [ATCPatient new];
    jennifer.name = @"Jennifer";
    jennifer.lastname=@"Hoffman";
    jennifer.dob =  @"01/31/XX";
    jennifer.pid = @"PCS13100";
    jennifer.wristbandCode = @"6";
    jennifer.type = kbed;
    jennifer.beaconKey = bed.hashedBeacon;
    jennifer.icon = [UIImage imageNamed:@"patient"];
    jennifer.title = [NSString stringWithFormat:@"%@ %@",jennifer.name, jennifer.lastname];
    jennifer.image =[UIImage imageNamed:@"bedside"];
    jennifer.vcname = @"ATCPatientViewController";
    jennifer.allergies = @"Hay Fever";
    
    ATCPatient * thomas = [ATCPatient new];
    thomas.name = @"Thomas Bahamas";
    thomas.lastname=@"Islander";
    thomas.dob =  @"03/02/XX";
    thomas.pid = @"TBI1";
    thomas.wristbandCode = @"7";
    thomas.type = kbed;
    thomas.beaconKey = bed.hashedBeacon;
    thomas.icon = [UIImage imageNamed:@"patient"];
    thomas.title = [NSString stringWithFormat:@"%@ %@",thomas.name, thomas.lastname];
    thomas.image =[UIImage imageNamed:@"bedside"];
    thomas.vcname = @"ATCPatientViewController";
    thomas.allergies = @"NKA";
    
    ATCPatient * venny = [ATCPatient new];
    venny.name = @"Venny";
    venny.lastname=@"Fib";
    venny.dob =  @"03/17/XX";
    venny.pid = @"ER101";
    venny.wristbandCode = @"8";
    venny.type = kbed;
    venny.beaconKey = bed.hashedBeacon;
    venny.icon = [UIImage imageNamed:@"patient"];
    venny.title = [NSString stringWithFormat:@"%@ %@",venny.name, venny.lastname];
    venny.image =[UIImage imageNamed:@"bedside"];
    venny.vcname = @"ATCPatientViewController";
    venny.allergies = @"NKA";
    
    NSArray * currentPatients = @[];
    NSDate * date = [NSDate new];
    float currentTime = [date timeIntervalSince1970];
	NSLog(@"%d",(int)currentTime);
	
    if(currentTime>1420580352&&currentTime<1420783199){
        currentPatients=@[vincent];
    }
    else if(currentTime > 1420783200 && currentTime<1420869600)
    {
        currentPatients=@[jennifer];
    }
    
    else if(currentTime > 1421301600 && currentTime<1421388000)
    {
        currentPatients=@[vincent];
    }
    else if(currentTime > 1421388000 && currentTime<1421474400)
    {
        currentPatients=@[jennifer];
    }
    
    else if(currentTime > 1421906400 && currentTime<1422684000)
    {
        currentPatients=@[stan];
    }
    
    else if(currentTime > 1423116000 && currentTime<1423202400)
    {
        currentPatients=@[gerard];
    }
    
    else if(currentTime > 1423202400 && currentTime<1423288800)
    {
        currentPatients=@[stan];
    }
    
    else if(currentTime > 1423720800 && currentTime<1423807200)
    {
        currentPatients=@[gerard];
    }
    
    else if(currentTime > 1423807200 && currentTime<1423893600)
    {
        currentPatients=@[thomas];
    }
    
    else if(currentTime > 1424325600 && currentTime<1424412000)
    {
        currentPatients=@[kathleen];
    }
    else if(currentTime > 1424412000 && currentTime<1424498400)
    {
        currentPatients=@[thomas];
    }
    
    else if(currentTime > 1424930400 && currentTime<1425016800)
    {
        currentPatients=@[kathleen];
    }
    else if(currentTime > 1425016800 && currentTime<1425708000)
    {
        currentPatients=@[venny];
    }
    else{
        currentPatients=@[jennie];
    }
    
    
    NSArray * allPatients = @[jennie,venny, thomas, jennifer, kathleen, gerard, stan, skylar,vincent ];
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
    simLabStation.data =@{@"patients":currentPatients};
    simLabStation.type=kroom;
    
    ATCStation * debriefingRoomStation= [ATCStation new];
    debriefingRoomStation.beaconKey = debriefingRoom.hashedBeacon;
    debriefingRoomStation.icon = [UIImage imageNamed:@""];
    debriefingRoomStation.title = @"Debriefing Room";
    debriefingRoomStation.image = [UIImage imageNamed:@"briefing_room"];
    debriefingRoomStation.vcname = @"ATCStationViewController";
    debriefingRoomStation.displayStopDate =@([future timeIntervalSince1970]);
    debriefingRoomStation.displayStartDate =@([past timeIntervalSince1970]);
    debriefingRoomStation.type = kbriefing;
    debriefingRoom.type = kbriefing;
    
    NSArray * beacons = @[room, sink, bed, bed2, debriefingRoom];
    
    
    NSMutableDictionary * dictionary =[@{}mutableCopy];
    for(ATCBeacon * beacon in beacons ){
        NSString * key = [ATCBeacon hashedBeacon:beacon.identifier major:beacon.major.integerValue minor:beacon.minor.integerValue];
        //single beacons
        [dictionary setObject:beacon forKey:key];
    }
    
    //all beacons
   // [dictionary setObject:beacons forKey:@"allBeacons"];
	NSMutableArray * stations = [@[] mutableCopy];

	//visible all patients
	for(ATCStation *st in currentPatients){
		[stations addObject:st];
	}
	
	
	[stations addObjectsFromArray:@[sinkStation,simLabStation,debriefingRoomStation]];
	
    NSDictionary * appData = @{@"stations":stations,@"beacons": dictionary, @"patients":allPatients};
    self.data = appData;
    
    
    return dictionary;
}




@end