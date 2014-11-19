//
//  ATCNetworkTest.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/8/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ATCBeacon;

@interface ATCNetworkTest : NSObject

-(void)testProximityData:(ATCBeacon *)beacon;
-(void)testRegionData:(ATCBeacon *)beacon;
-(void)testLogin;

@end
