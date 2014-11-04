//
//  ATCPatientViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/31/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCPatientViewController.h"
#import  "ATCPatient.h"
#import  "DataSource.h"
#import "ATCStation.h"

@interface ATCPatientViewController()
@property (strong, nonatomic) IBOutlet UIImageView *patientIcon;
@property (strong, nonatomic)DataSource * datasource;
@property (strong, nonatomic)NSMutableDictionary * patientsData;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ATCPatient * patient;


@end

@implementation ATCPatientViewController

-(void)setStation:(ATCStation *)station{
    if(!_patientsData) _patientsData = [NSMutableDictionary new];
    self.patient = (ATCPatient *)station;
    [self.patientsData setObject:_patient.name forKey:@"name"];
    [self.patientsData setObject:_patient.lastname forKey:@"lastName"];
    [self.patientsData setObject:_patient.dob forKey:@"dob"];
    [self.patientsData setObject:_patient.pid  forKey:@"pid"];
}


-(void)viewDidLoad{
    [super viewDidLoad];
     self.datasource = [[DataSource alloc]initWithItems:self.patientsData.allKeys cellIdentifier:@"patients_cell" configureCellBlock:^(UITableViewCell *cell, NSString * key, id indexPath) {
        cell.detailTextLabel.text = [self.patientsData objectForKey:key];
        cell.textLabel.text = key;
        
        
    }];
    self.tableView.dataSource = self.datasource;
    self.datasource.headers= @[@"Patient's Information"];
    [self.tableView reloadData];
    
}


@end
