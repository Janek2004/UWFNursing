//
//  ATCState.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCState : NSObject
    @property(nonatomic, assign)NSInteger session;
    @property(nonatomic, assign)BOOL primaryNurse;
    @property (readonly) BOOL loggedIn;
    @property (nonatomic, assign)NSInteger nurse;


@end
