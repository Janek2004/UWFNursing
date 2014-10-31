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
@interface ATCPatientViewController()
@property (strong, nonatomic) IBOutlet UIImageView *patientIcon;
@property (strong, nonatomic)DataSource * datasource;
@property (strong, nonatomic)NSMutableDictionary * patientsData;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ATCPatientViewController
-(void)setPatient:(ATCPatient *)patient{
    if(!_patientsData)_patientsData = [NSMutableDictionary new];

    [self.patientsData setObject:patient.name forKey:@"name"];
    [self.patientsData setObject:patient.lastname forKey:@"lastName"];
    [self.patientsData setObject:patient.dob forKey:@"dob"];
    [self.patientsData setObject:patient.pid    forKey:@"pid"];
    
    self.datasource = [[DataSource alloc]initWithItems:self.patientsData.allKeys cellIdentifier:@"patients_cell" configureCellBlock:^(UITableViewCell *cell, NSString * key, id indexPath) {
        cell.detailTextLabel.text = [self.patientsData objectForKey:key];
        cell.textLabel.text = key;
        
        
    }];
    self.tableView.dataSource = self.datasource;
    [self.tableView reloadData];
    self.datasource.headers= @[@"Patient's Information"];
    
    
    _patient = patient;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if(self.patient) [self setPatient:self.patient];
    
}


@end
