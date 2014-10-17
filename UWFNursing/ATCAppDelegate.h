//
//  ATCAppDelegate.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMCBeaconManager;
@class ATCBeaconNetworkUtilities;
@class ATCBeaconContentManager;
@class ATCState;

@interface ATCAppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic, strong) JMCBeaconManager * beaconManager;
@property(nonatomic, strong) ATCBeaconNetworkUtilities * networkManager;
@property(nonatomic, strong) ATCBeaconContentManager * contentManager;
@property(nonatomic,strong)  ATCState * state;


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray * patients;
@property (nonatomic,assign) BOOL warning;


@end
