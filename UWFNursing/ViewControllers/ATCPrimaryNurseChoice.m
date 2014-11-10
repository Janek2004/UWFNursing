//
//  ATCPrimaryNurseChoice.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCPrimaryNurseChoice.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCAppDelegate.h"
#import "ATCState.h"

@interface ATCPrimaryNurseChoice()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,strong)ATCBeaconNetworkUtilities * networkUtils;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;




@end

@implementation ATCPrimaryNurseChoice

-(void)viewDidLoad{
    [super viewDidLoad];
    _networkUtils = [[ATCBeaconNetworkUtilities alloc]init];
     self.navigationController.navigationBarHidden = YES;
}

- (IBAction)confirmChoice:(id)sender {
    ATCAppDelegate *appd = [[UIApplication sharedApplication]delegate];
    ;
    
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
 
    [self.segmentedControl setEnabled:NO];
    self.segmentedControl.hidden = YES;
    self.continueButton.hidden= YES;
    [self.activityIndicator startAnimating];
    
    [_networkUtils changeStatus:appd.state.session primaryNurse:[self.segmentedControl selectedSegmentIndex] withCompletionHandler:^(NSError *error, NSString *message) {
        [sender setEnabled:YES];
        [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];

        
        if(error||message){
            UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [av show];
        }
        else{
            //progress to main menu
            UIViewController * homeVc= [self.storyboard instantiateViewControllerWithIdentifier:@"ATCViewController"];
            self.segmentedControl.hidden = NO;
            self.continueButton.hidden= NO;
            [self.activityIndicator stopAnimating];
            
            
            [self.navigationController pushViewController:homeVc animated:YES];
        }

    }];

    
}



@end
