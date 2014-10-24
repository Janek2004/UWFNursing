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
    
   // XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);

}

//
//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
