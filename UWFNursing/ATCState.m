//
//  ATCState.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCState.h"
#import <ATCAppDelegate.h>
#import "ATCBeaconNetworkUtilities.h"

@interface ATCState() <UINavigationControllerDelegate>
    @property(nonatomic,strong) UIBarButtonItem * logoutButton;
    @property(nonatomic,strong) ATCBeaconNetworkUtilities *networkUtilities;
@end

@implementation ATCState

-(id)init{
    if(self = [super init])
    {
        //add notifications
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginNotification:) name:@"LOGIN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutNotification:) name:@"LOGOUT" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseNotification:) name:@"NURSE_STATUS" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseScanNotification:) name:@"BARCODE_SCAN" object:nil];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseOverrideNotification:) name:@"NURSE_OVERRIDE" object:nil];
        

        ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
        UINavigationController * nav = (UINavigationController *) delegate.window.rootViewController;
        nav.delegate = self;
        
        _logoutButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
        
        _networkUtilities = [[ATCBeaconNetworkUtilities alloc]init];
        
        
        
    }
    return self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(_session !=0){
        viewController.navigationItem.rightBarButtonItem =self.logoutButton;
    }
    else{
        viewController.navigationItem.rightBarButtonItem = nil;
    }
}

/**Log in notification*/
-(void)loginNotification:(NSNotification *)notification{
    _nurse =  [[[notification userInfo] valueForKey:@"user"]integerValue];
    _session =  [[[notification userInfo] valueForKey:@"session"]integerValue];
}

/**Used to logout the user*/
-(void)logout{
    [self loginNotification:nil];
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
    UINavigationController * nav = (UINavigationController *) delegate.window.rootViewController;
    [nav popToRootViewControllerAnimated:YES];
   
}


/**Log out notification*/
-(void)logoutNotification:(NSNotification *)notification{
    _nurse = 0;
    _session = 0;
    _primaryNurse = 0;
}

/** nurse status notification*/
-(void)nurseNotification:(NSNotification *)notification{
      _primaryNurse =  [[[notification userInfo] valueForKey:@"primary"]integerValue];
    
}

/** nurse override notification */
-(void)nurseOverrideNotification:(NSNotification *)notification{
    //_primaryNurse =  [[[notification userInfo] valueForKey:@"override"]integerValue];
    [_networkUtilities overrideWarningForSession:self.session andNurse:self.nurse ];

}


-(void)nurseScanNotification:(NSNotification *)notification{
    NSString * barcode = [[notification userInfo] valueForKey:@"barcode"];
    [_networkUtilities scanBarcode:barcode.integerValue userId:self.nurse sessionId:self.session withCompletionHandler: ^(NSError *error) {
        
    }];
}



-(BOOL)loggedIn{
    return self.nurse!=0;
}


//main logic of application goes here
-(BOOL)showWarning{
    //get average time of hand washing
    
    //get time between hand washing and approaching the patient's bed
    
    //get time between leaving the room and leaving patient's bed
    
    //if that time is in the limits display warning.
    
    
    
    
    
    return  NO;
}






@end
