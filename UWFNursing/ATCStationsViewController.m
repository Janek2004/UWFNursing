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
#import "Protocols.h"
#import "ATCStationTableViewCell.h"

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
    self.datasource = [[DataSource alloc]initWithItems:delegate.state.stations  cellIdentifier:@"station_cell" configureCellBlock:^(ATCStationTableViewCell * cell, ATCStation * item, id indexPath) {
		[cell layoutSubviews];
		
//		cell = [[ATCStationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"station_cell"];
	
		
        if([item isKindOfClass:[ATCStation class]]){
            cell.imageView.image = item.icon;
            cell.textLabel.text= [NSString stringWithFormat:@"%@",item.title];
//
//			cell.progressView.hidden = NO;
			
			
			dispatch_async(dispatch_get_main_queue(), ^{
				// do work here
				double value = 0.0;
				switch (item.proximity){
					case CLProximityFar: {
						value = 1/3.0;
						[cell setProgress:value ];
						break;
					}
					case CLProximityNear: {
						value = 2/3.0;
						[cell setProgress:value ];
						break;
					}
						
					case CLProximityImmediate: {
						value = 3/3.0;
						[cell setProgress:value ];
						break;
					}
						
					default:{
						//cell.progressView.hidden = YES;
						[cell setProgress:value ];
						break;
					}
				
				
				}
				
			
			
			});
			
			       }
    }];
	
    
    self.datasource.headers = @[@"Nearby Locations"];
    [self.tableView reloadData];
     self.tableView.delegate = self;
   

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 75;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"stations"]){
        NSArray * patients = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"Patients: %@",patients);
        
        self.datasource.items = patients;
        self.tableView.dataSource = self.datasource;
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.tableView reloadData];
		});

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
    id <StationVC> vc;//=NULL;
    @try {
        vc = [self.storyboard instantiateViewControllerWithIdentifier:station.vcname];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@ %s",exception.debugDescription,__PRETTY_FUNCTION__);
        return;
    }
    @finally {
        if(vc){
            [vc setStation:station];
//            [vc setStation:station];
            [self.navigationController pushViewController:(UIViewController *)vc animated:YES];
        }
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
