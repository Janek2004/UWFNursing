//
//  ATCRegionsViewController.m
//  UWFNursing
//
//  Created by sadmin on 10/22/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCRegionsViewController.h"
#import "ATCAppDelegate.h"
#import "DataSource.h"
#import "ACTPatientCell.h"
#import "ATCPatient.h"
#import "ATCState.h"

@interface ATCRegionsViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataSource *datasource;
@end

@implementation ATCRegionsViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"patient_cell"];
    self.datasource = [[DataSource alloc]initWithItems:delegate.state.regionEvents  cellIdentifier:@"patient_cell" configureCellBlock:^(UITableViewCell* cell, NSDictionary * item, id indexPath) {
 
          NSNumber * state =  [item objectForKey:@"state"];
          NSNumber * type = [item objectForKey:@"type"];
          NSNumber * date= [item objectForKey:@"date"];
            
          NSString * s = [NSString stringWithFormat:@"State: %@ Type:(0 sink) %@ date: %@",state,type,date];
            cell.textLabel.text= s;
            cell.textLabel.font = [UIFont systemFontOfSize:9.0];
            
        
    }];
    self.datasource.headers = @[@"Region Events"];
    self.tableView.dataSource = self.datasource;
    [self.tableView reloadData];
//    [delegate.state addObserver:self forKeyPath:@"regionEvents" options:NSKeyValueObservingOptionNew context:nil];
//    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"regionEvents"]){
        NSArray * patients = [change objectForKey:NSKeyValueChangeNewKey];
        self.datasource.items = patients;
        self.tableView.dataSource = self.datasource;
        [self.tableView reloadData];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    @try {
      //  ATCAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
       // [delegate.state removeObserver:self forKeyPath:@"regionEvents"];
    }
    @catch (NSException *exception) {
           }
    @finally {
    }    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
