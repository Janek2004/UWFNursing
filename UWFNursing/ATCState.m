//
//  ATCState.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCState.h"

@implementation ATCState

-(id)init{
    if(self = [super init])
    {
        //add notifications
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginNotification:) name:@"LOGIN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutNotification:) name:@"LOGOUT" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseNotification:) name:@"NURSE_STATUS" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseScanNotification:) name:@"NURSE_SCAN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(patientScanNotification:) name:@"PATIENT_SCAN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(patientScanNotification:) name:@"NURSE_OVERRIDE" object:nil];
    }
    return self;
}

/**Log in notification*/
-(void)loginNotification:(NSNotification *)notification{
    _nurse =  [[[notification userInfo] valueForKey:@"user"]integerValue];
    _session =  [[[notification userInfo] valueForKey:@"session"]integerValue];
    
}

/**Log out notification*/
-(void)logoutNotification:(NSNotification *)notification{
    _nurse = 0;
    _session = 0;
}

/** nurse status notification*/
-(void)nurseNotification:(NSNotification *)notification{
      _primaryNurse =  [[[notification userInfo] valueForKey:@"primary"]integerValue];
}

/** nurse override notification */
-(void)nurseOverrideNotification:(NSNotification *)notification{
    //_primaryNurse =  [[[notification userInfo] valueForKey:@"override"]integerValue];
}



-(void)nurseScanNotification:(NSNotification *)notification{
    
}

-(void)patientScanNotification:(NSNotification *)notification{
    
}


-(BOOL)loggedIn{
    return self.nurse!=0;
}


//-(void)loggedIn:()


@end
