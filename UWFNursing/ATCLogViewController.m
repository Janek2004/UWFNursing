//
//  ATCLogViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 8/8/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCLogViewController.h"
#import "ATCAppDelegate.h"
#import "JMCBeaconManager.h"

@interface ATCLogViewController ()

@property (strong, nonatomic) IBOutlet UITextView *logView;

@end

@implementation ATCLogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshLog:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)refreshLog:(id)sender
{
    ATCAppDelegate *dl = [[UIApplication sharedApplication]delegate];
    self.logView.text = [dl.beaconManager getLog];
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
