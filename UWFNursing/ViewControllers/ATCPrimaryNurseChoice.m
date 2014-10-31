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
            [self.navigationController pushViewController:homeVc animated:YES];
        }

    }];

    
}



@end
