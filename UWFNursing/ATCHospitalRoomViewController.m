//
//  ATCHospitalRoomViewController.m
//  UWFNursing
//
//  Created by sadmin on 11/1/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCHospitalRoomViewController.h"
#import "DataSource.h"
#import "ATCBedStationViewController.h"
#import "ATCStation.h"
#import "ATCPatientCell.h"
#import "ATCPatient.h"
#import "ATCPatientViewController.h"


@interface ATCHospitalRoomViewController ()<UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)DataSource * datasource;
@property(strong, nonatomic)NSArray *patients;


@end

@implementation ATCHospitalRoomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.datasource = [[DataSource alloc]initWithItems:self.patients  cellIdentifier:@"patient_cell" configureCellBlock:^(UITableViewCell* cell, ATCPatient * item, id indexPath) {
        if([item isKindOfClass:[ATCPatient class]]){
            //[cell.distanceSlider setValue:item.proximity animated:YES];
            cell.imageView.image = item.icon;
            cell.textLabel.text= [NSString stringWithFormat:@"%@ %@",item.name, item.lastname];
        }
    }];
    self.tableView.dataSource = self.datasource;
    self.datasource.headers = @[@"Patients"];
    [self.tableView reloadData];
    self.tableView.delegate =self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStation:(ATCStation *)station{
    //station should come with array of patients
    _station = station;
    self.patients = [station.data objectForKey:@"patients"];
    self.datasource.items = self.patients;
    self.tableView.dataSource = self.datasource;
    [self.tableView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //patient
    ATCPatient * patient = [self.datasource.items objectAtIndex:indexPath.row];
    ATCPatientViewController * vc;
    @try {
        vc = [self.storyboard instantiateViewControllerWithIdentifier:patient.vcname];
    
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        if(vc){
            vc.patient = patient;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}







#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    if([segue.identifier isEqualToString:@"patient_segue"]){
//           ATCPatientViewController * vc =  segue.destinationViewController;
//        vc setPatient:self
//    }
//
//}
//

@end
