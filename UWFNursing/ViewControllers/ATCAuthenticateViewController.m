//
//  ATCAuthenticateViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCAuthenticateViewController.h"
#import "ATCStationsViewController.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCAppDelegate.h"


@import LocalAuthentication;

@interface ATCAuthenticateViewController ()<UIAlertViewDelegate>
@property (nonatomic,strong) ATCBeaconNetworkUtilities * networkUtilities;
@property (strong, nonatomic) IBOutlet UILabel *message_label;
@property (strong, nonatomic) IBOutlet UITextField *usernameLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIButton *authenticateButton;

@end


@implementation ATCAuthenticateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.navigationController.navigationBarHidden = YES;
    _networkUtilities = [ATCBeaconNetworkUtilities new];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.message_label.text=nil;
    //[self authenticate:nil];
    [self.usernameLabel becomeFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** Authenticating User */
- (IBAction)authenticate:(id)sender {
    [self.activityIndicator startAnimating];
    [self.authenticateButton setEnabled:NO];
    [self.usernameLabel setEnabled:NO];
    [self.passwordLabel setEnabled:NO];
 
    [_networkUtilities loginUserWithUsername:self.usernameLabel.text andPassword:self.passwordLabel.text withCompletionHandler:^(NSError *error, NSUInteger userId,NSInteger session, NSInteger warningState, NSString *errorMessage) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            [self.authenticateButton setEnabled:YES];
            [self.usernameLabel setEnabled:YES];
            [self.passwordLabel setEnabled:YES];
            
            if(!error && !errorMessage &&session != 0 &&userId!=0)
            {    //send notification
              
                NSNotification * notification =[[NSNotification alloc]initWithName:@"LOGIN" object:nil userInfo:@{@"user":@(userId), @"session":@(session), @"warning_state":@(warningState) }];
                [[NSNotificationCenter defaultCenter]postNotification:notification];
                
                UIViewController *homeVC= [self.storyboard instantiateViewControllerWithIdentifier:@"ATCPrimaryNurseChoice"];
                [self.navigationController pushViewController:homeVC animated:YES];
            }
            else{
                if(errorMessage) self.message_label.text = errorMessage;
                
            }
        });
        
    }];
}


-(void)unused{
    LAContext *context = [[LAContext alloc] init];
    __block  NSString *msg;
    
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(@"UNLOCK_ACCESS_TO_LOCKED_FATURE", nil) reply:
         ^(BOOL success, NSError *authenticationError) {
             if (success) {
                 msg =[NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_SUCCESS", nil)];
                 dispatch_async(dispatch_get_main_queue(), ^{
                     ATCStationsViewController *homeVC= [self.storyboard instantiateViewControllerWithIdentifier:@"ATCViewController"];
                     
                     [self.navigationController pushViewController:homeVC animated:YES];
                 });
                 
                 
                 
             } else {
                 
                 switch (authenticationError.code) {
                     case LAErrorUserFallback:
                         //show passcode
                         [self showDefaultAuthentication];
                         break;
                         
                     default:
                         [self showDefaultAuthentication];
                         break;
                 }
                 
                 // show the authentication UI with our reason string
                 msg = [NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_WITH_ERROR", nil), authenticationError.localizedDescription];
             }
             
         }];
        
    }
    else{
        [self showDefaultAuthentication];
    }
}


/** In case if 'fancy' authentication fails */
-(void)showDefaultAuthentication{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView * a = [[UIAlertView alloc]initWithTitle:@"Authenticate" message:@"Please log in." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
        
        a.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
        [a show];
    });
}

/**Alert view delegate callback*/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     
       UITextField *username = [alertView textFieldAtIndex:0];
       UITextField *password = [alertView textFieldAtIndex:1];
    
    
    [_networkUtilities loginUserWithUsername:username.text andPassword:password.text withCompletionHandler:^(NSError *error, NSUInteger userId,NSInteger session, NSInteger warningState, NSString *errorMessage) {
       
        //send notification
        NSNotification * notification =[[NSNotification alloc]initWithName:@"LOGIN" object:nil userInfo:@{@"user":@(userId), @"session":@(session), @"warning_state":@(warningState) }];
        [[NSNotificationCenter defaultCenter]postNotification:notification];

        [[NSNotificationCenter defaultCenter]postNotification:notification];
      
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!error && !errorMessage &&session != 0 &&userId!=0)
            {
                UIViewController *homeVC= [self.storyboard instantiateViewControllerWithIdentifier:@"ATCPrimaryNurseChoice"];
                [self.navigationController pushViewController:homeVC animated:YES];
            }
            else{
                if(errorMessage) self.message_label.text = errorMessage;
                
                }
        });
        
    }];
    
    
    

}

-(void)viewDidUnload{
    [super viewDidUnload];
    [self.activityIndicator stopAnimating];
    self.message_label.text=nil;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)usernameLabel:(id)sender {
}
@end
