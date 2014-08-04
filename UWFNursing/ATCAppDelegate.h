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

@interface ATCAppDelegate : UIResponder <UIApplicationDelegate>
 @property(nonatomic, strong) JMCBeaconManager * beaconManager;
 @property(nonatomic, strong) ATCBeaconNetworkUtilities * networkManager;
 @property (strong, nonatomic) UIWindow *window;

@end
