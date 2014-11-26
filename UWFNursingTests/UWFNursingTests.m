//
//  UWFNursingTests.m
//  UWFNursingTests
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ATCAppDelegate.h"
#import "ATCState.h"
#import "ATCBeacon.h"

@interface UWFNursingTests : XCTestCase
@property (nonatomic,strong) ATCState * state;
@end

@implementation UWFNursingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testWarning{
    
    ATCState *state = [ATCState new];
    ATCAppDelegate * delegate = [[ATCAppDelegate alloc]init];
    NSDictionary * dictionary = [delegate parseData];
    
    //get beacons
    NSArray * beacons = [dictionary objectForKey:@"beacons"];
    
    ATCBeacon * sink = [[beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type==%@ ",@(ksink)]]lastObject];
    ATCBeacon * bed = [[beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type==%@ ",@(kbed)]]lastObject];
    ATCBeacon * simlab = [[beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type==%@ ",@(kroom)]]lastObject];
    ATCBeacon * briefing = [[beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type==%@ ",@(kbriefing)]]lastObject];
    
    
    [state registerProximity:briefing andProximity:CLProximityFar];
    [state registerProximity:briefing andProximity:CLProximityNear];
    [state registerProximity:simlab   andProximity:CLProximityNear];
    [state registerProximity:briefing andProximity:CLProximityFar];
    
    BOOL response = [state logicFor:briefing];
    
    assert(response == true);
    assert(state.location == kbriefing);
    
    [state registerProximity:simlab andProximity:CLProximityFar];
    [state registerProximity:bed andProximity:CLProximityNear];
    [state registerProximity:simlab andProximity:CLProximityNear];
    [state registerProximity:simlab andProximity:CLProximityFar];
    [state registerProximity:bed andProximity:CLProximityFar];
    [state registerProximity:bed andProximity:CLProximityNear];
    [state registerProximity:bed andProximity:CLProximityNear];
    

    response = [state logicFor:bed];
    assert(response == false);
    assert(state.location == kbed);

    [state registerProximity:simlab andProximity:CLProximityFar];
    [state registerProximity:briefing andProximity:CLProximityNear];
    [state registerProximity:simlab andProximity:CLProximityNear];
    [state registerProximity:simlab andProximity:CLProximityFar];
    
    response = [state logicFor:simlab];
    
    assert(response == true);
    assert(state.location == kroom);
    

    
    //get current location kbed=1,kroom=2,kbriefing=3,ksink=4,koverride=5,kunknown=6
    
    
    


}

//
//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
