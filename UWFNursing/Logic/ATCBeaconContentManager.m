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



@end