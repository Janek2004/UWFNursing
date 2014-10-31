//
//  ATCViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCViewController.h"
#import "ATCAppDelegate.h"
#import "DataSource.h"
#import "ACTPatientCell.h"
#import "ATCPatient.h"
#import "ATCState.h"
#import "ATCPatientViewController.h"

@import CoreLocation;

@interface ATCViewController ()
    @property (strong, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) DataSource *datasource;
@end

@implementation ATCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
    self.datasource = [[DataSource alloc]initWithItems:delegate.state.patients  cellIdentifier:@"patient_cell" configureCellBlock:^(ACTPatientCell* cell, ATCPatient * item, id indexPath) {
        if([item isKindOfClass:[ATCPatient class]]){
            //[cell.distanceSlider setValue:item.proximity animated:YES];
            cell.iconImageView.image = item.icon;
            cell.nameLabel.text= [NSString stringWithFormat:@"%@ %@",item.name, item.lastname];
        }
    }];
    self.datasource.headers = @[@"Nearby Patients"];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"patients"]){
        NSArray * patients = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"%@",patients);
        
        self.datasource.items = patients;
        self.tableView.dataSource = self.datasource;
        [self.tableView reloadData];
    }
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    @try {
        ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
        [delegate.state removeObserver:self forKeyPath:@"patients"];
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    //self.navigationController.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    @try {
        ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
        [delegate.state addObserver:self forKeyPath:@"patients" options:NSKeyValueObservingOptionNew context:nil];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"patient_segue"]){
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        ATCPatient * patient=  [self.datasource.items objectAtIndex:indexPath.row];
        [segue.destinationViewController setPatient: patient];
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
