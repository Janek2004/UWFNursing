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
@property (nonatomic,copy) void (^patiensBlock)(NSArray *);

@end


@implementation ATCBeaconContentManager
//how to link ibeacons to content?
//when we entered the region

-(instancetype)init{
    if(self = [super init]){
        _patients = [NSMutableDictionary new];

    }
    return self;
}

-(id)initWithCompletion:(void (^)(NSArray *))patientsBlock{
    self = [self init];
    if(self){
        self.patiensBlock = [patientsBlock copy];
    }
    return self;
}

/**
    Check beacons
*/
-(NSArray *)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)proximity{
    
   NSString *key =  [ATCBeacon hashedBeacon:beaconId major:major.integerValue minor:minor.integerValue];
        //if([self.data objectForKey:key]) return self.patients;
        NSDictionary * beaconData = [self.data objectForKey:key];
    
        NSInteger type = [[beaconData objectForKey:@"type"]integerValue];
        if(type != kbed) return self.patients.allValues;
        //get patients
        NSArray *patients = [beaconData objectForKey:@"patients"];
        for(ATCPatient *patient in patients)
        {
           NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
           if(patient.displayStartDate.integerValue<timestamp&&patient.displayStopDate.integerValue>timestamp){
               if(proximity== CLProximityUnknown){
                  [self.patients removeObjectForKey:patient.pid];
                }
               else{
                   [self.patients setObject:patient forKey:patient.pid];
               }
            }
           else{
               [self.patients removeObjectForKey:patient.pid];
           
           }
        }
    
    return self.patients.allValues;
}

-(void)addPatient:(ATCPatient *)patient id:(NSString *)bid{
    
    [self.patients setObject:@{@"date":[NSDate new],@"patient":patient} forKey:bid];
    
                   
}

-(void)removeAll;{
    [self.patients removeAllObjects];
}


@end