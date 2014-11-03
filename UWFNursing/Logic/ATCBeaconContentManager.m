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
@property (nonatomic,strong) NSMutableDictionary * stationsCompleteDictionary;

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

/**
    Check beacons
*/
-(NSArray *)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)proximity{
    
        NSString *key =  [ATCBeacon hashedBeacon:beaconId major:major.integerValue minor:minor.integerValue];

        ATCStation * station =[self.stationsCompleteDictionary objectForKey:key];
        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    
    //if it doesn't exist we need to add it.
        if(![self.stations objectForKey:key]){
            if(proximity!=0){
                if(station.displayStartDate.integerValue<timestamp&&station.displayStopDate.integerValue>timestamp){
                   [self.stations setObject:station  forKey:key];
                }
                
                if(!station.displayStartDate.integerValue<timestamp&&!station.displayStopDate){
                    [self.stations setObject:station  forKey:key];
                }
            }
            return self.stations.allValues;
        }
    //it should exist but proximity is unknown. Therefore we need to remove it
        if(proximity == 0){
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


-(void)setData:(NSDictionary *)data{
    _data =data;
    NSArray *array = [data objectForKey:@"stations"];
    for(ATCStation * station in array){
        [self.stationsCompleteDictionary setObject:station forKey:station.beaconKey];
    }
    
}



@end