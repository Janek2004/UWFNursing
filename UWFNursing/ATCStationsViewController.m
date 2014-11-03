//
//  ATCViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCStationsViewController.h"
#import "ATCAppDelegate.h"
#import "DataSource.h"
#import "ATCPatientCell.h"
#import "ATCPatient.h"
#import "ATCState.h"
#import "ATCPatientViewController.h"

@import CoreLocation;

@interface ATCStationsViewController ()<UITableViewDelegate>
    @property (strong, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) DataSource *datasource;
    //@property (strong, nonatomic) NSArray * stations;
@end

@implementation ATCStationsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
    self.datasource = [[DataSource alloc]initWithItems:delegate.state.stations  cellIdentifier:@"station_cell" configureCellBlock:^(UITableViewCell* cell, ATCStation * item, id indexPath) {
        
        if([item isKindOfClass:[ATCStation class]]){
            cell.imageView.image = item.icon;
            cell.textLabel.text= [NSString stringWithFormat:@"%@",item.title];
        }
    }];
    
    self.datasource.headers = @[@"Nearby"];
    [self.tableView reloadData];
    

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
        [delegate.state removeObserver:self forKeyPath:@"stations"];
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
        [delegate.state addObserver:self forKeyPath:@"stations" options:NSKeyValueObservingOptionNew context:nil];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //get row
    ATCStation* station = [self.datasource.items objectAtIndex:indexPath.row];
    if(!station.vcname) return;
    UIViewController * vc=NULL;
    @try {
        vc = [self.storyboard instantiateViewControllerWithIdentifier:station.vcname];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@ %s",exception.debugDescription,__PRETTY_FUNCTION__);
        return;
    }
    @finally {
        if(vc){
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"patient_segue"]){
//        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
//        ATCPatient * patient=  [self.datasource.items objectAtIndex:indexPath.row];
//        [segue.destinationViewController setPatient: patient];
//        
//    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
