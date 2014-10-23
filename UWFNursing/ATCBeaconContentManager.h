//
//  ATCBeaconContentManager.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/30/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//
@import CoreLocation;

@interface ATCBeaconContentManager : NSObject {
    
}

//
@property (nonatomic,strong) NSMutableDictionary * patients;
-(id)contentForBeaconID:(NSString *)beaconId andMajor:(NSNumber *)major andMinor:(NSNumber *)minor proximity:(CLProximity)pr;
-(id)initWithCompletion:(void (^)(NSArray *))patientsBlock;
-(void)removeAll;


@end
