//
//  ATCNetworkTest.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/8/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCNetworkTest.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCBeacon.h"

@interface ATCNetworkTest()

@property (nonatomic,strong)ATCBeaconNetworkUtilities *networkUtils;

@end

@implementation ATCNetworkTest

-(id)init{
    self = [super init];
    if(self){
        _networkUtils = [ATCBeaconNetworkUtilities new];
    
    }
    return self;

}


-(void)testProximityData:(ATCBeacon *)beacon{
    
    [_networkUtils sendProximityDataForBeacon:beacon.major.intValue minor:beacon.minor.intValue proximityID:beacon.identifier proximity:CLProximityFar user:[NSString stringWithFormat:@"%d",367] withErrorCompletionHandler:^(NSError *error) {
               NSLog(@"Error %@ %s", error,__PRETTY_FUNCTION__);
        
    }];
}

-(void)testRegionData:(ATCBeacon *)beacon{
    
    [_networkUtils sendRegionNotification:beacon.major.intValue minor:beacon.minor.intValue proximityID:beacon.identifier regionState:CLRegionStateInside user:@"367" withErrorCompletionHandler:^(NSError *error) {
        NSLog(@"Error %@ %s", error,__PRETTY_FUNCTION__);
    }];
 }



-(void)testLogin;{
    
    [_networkUtils loginUserWithUsername:@"Tester1" andPassword:@"Tester1" withCompletionHandler:^(NSError *error, NSUInteger userId, NSInteger session, NSInteger warningState, NSString *errorMessage) {
 
        NSLog(@"Error %@ %s", error,__PRETTY_FUNCTION__);
        NSLog(@"User id %d", (int)userId);
        NSLog(@"Warning State is %d", (int)warningState);
        
        NSLog(@"Error %@", errorMessage);
        
    }];
  
    //http://atcwebapp.argo.uwf.edu/trainingstations/wp_trainingstations/?missions_json=1&action=updatenurse&nurse=0&session=6
    // http://atcwebapp.argo.uwf.edu/trainingstations/wp_trainingstations/?missions_json=1&action=saveProximity&beacon_uuid=f7826da6-4fa2-4e98-8024-bc5b71e0893e&beacon_minor=5919&beacon_major=6914&user=0&proximity=3&event_date=1414097741.333884
}
@end
