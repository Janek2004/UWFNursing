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

-(id)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)pr{
    //check whick kind of ibeacon it is?
    #warning get dynamic content in the future

    if([minor  isEqual: @5919] && [major  isEqual: @6914]){
        NSString * bid = [self generateID:beaconId andMajor:major andMinor:minor];
      //  [allKeys removeObject:bid];
        //check how old the data is
        if([_patients objectForKey:bid]){
            #warning content expiration date
            /*
                 
                 NSDate * d = [[_patients objectForKey:bid]objectForKey:@"date"];
                 NSDate * now = [NSDate new];

                 if([now timeIntervalSinceDate:d]>REFRESH_RATE)
                 {
                 //download content for the beacon
                 [self addPatient: id:bid];
                 change = true;
                 }
            
        */
          if(pr== CLProximityUnknown){
                [self.patients removeObjectForKey:bid];
                 self.patiensBlock(self.patients.allValues);
                 return [self getPatients];
          }
            
            }
            else{
                if(pr== CLProximityUnknown){
                    [self.patients removeObjectForKey:bid];
                    self.patiensBlock(self.patients.allValues);
                }
                else{
                    ATCPatient * patient = [[ATCPatient alloc]init];
                    
                    patient.name = @"Skyler";
                    patient.lastname=@"Jansen";
                    patient.dob =  @"3/11/xx";
                    patient.pid = @"MR PCS33300";
                      [self addPatient:patient id:bid];
                }
                
                
              
                
                self.patiensBlock(self.patients.allValues);
            }
        }
    
//    if(allKeys.count>0){
//        for(NSString * key in allKeys){
//            [self.patients removeObjectForKey:key];
//        }
//        self.patiensBlock([self getPatients]);
//    }
    
   //remove all objects remaining in allKeys array

    //connect to web service and check if this is patient or something else
    //we will return stations
    
    //check the type of the stations

    //if patients we will modify the patients dictionary information
 
    
    return [self getPatients];
}

-(NSArray *)getPatients{
    NSMutableArray * a = [NSMutableArray new];
    for(NSDictionary * d in self.patients.allValues ){
        [a addObject:[d objectForKey:@"patient"]];
    }
    
    return a;
}

-(void)addPatient:(ATCPatient *)patient id:(NSString *)bid{
    
    [self.patients setObject:@{@"date":[NSDate new],@"patient":patient} forKey:bid];
    
                   
}

-(void)removeAll;{
    [self.patients removeAllObjects];
}

/**
 *  Generates unique ID
 *
 *  @param beaconId beacon identifier
 *  @param major    beacon major
 *  @param minor    beacon minor
 *
 *  @return returns string with unique identifier
 */
-(NSString *)generateID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor{

    //according to estimote id has format: proximityUUID.major.minor
   // NSString * log = [NSString stringWithFormat:@"%s",__PRETTY_FUNCTION__];
  
    
    return [NSString stringWithFormat:@"%@.%@.%@",beaconId,major,minor];
}

@end