//
//  ATCBedStationViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/31/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//
#import "DataSource.h"
#import "ATCAppDelegate.h"
#import "ATCBedStationViewController.h"
#import "ATCStation.h"
#import "ATCPatientCell.h"
#import "ATCPatient.h"
#import "ATCPatientViewController.h"


@interface ATCBedStationViewController()
@property (strong, nonatomic) IBOutlet UIImageView *bedsideImage;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)DataSource * datasource;

@property(strong, nonatomic)NSArray *patients;


@end

@implementation ATCBedStationViewController

-(void)setStation:(ATCStation *)station{
        //station should come with array of patients
    _station = station;
    self.patients = [station.data objectForKey:@"patients"];
    
    }

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.datasource = [[DataSource alloc]initWithItems:self.patients  cellIdentifier:@"patient_cell" configureCellBlock:^(ATCPatientCell* cell, ATCPatient * item, id indexPath) {
        if([item isKindOfClass:[ATCPatient class]]){
            //[cell.distanceSlider setValue:item.proximity animated:YES];
            cell.imageView.image = item.icon;
            cell.nameLabel.text= [NSString stringWithFormat:@"%@ %@",item.name, item.lastname];
        }
    }];
    self.datasource.headers = @[@"Nearby Patients"];
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"patient_segue"]){
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        ATCPatient * patient=  [self.datasource.items objectAtIndex:indexPath.row];
        [segue.destinationViewController setPatient: patient];
    }
}



@end
