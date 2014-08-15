//
//  ATCDocumentsViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 7/29/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCDocumentsViewController.h"
#import "DataSource.h"
#import "ATCDetailsWebViewController.h"
#define DocumentCellId @"Docs cell id"
@interface ATCDocumentsViewController ()
 @property(nonatomic,strong) DataSource * datasource;
 @property(nonatomic,strong)NSArray * documents;
@end

@implementation ATCDocumentsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _documents = @[@"OB POSTPARTUM ASSESSMENT",@"OB PPD",@"PEDS ASTHMA",
                   @"PEDS G & D",
                   @"Juniorsimapp1",@"Juniorsimapp2",@"Juniorsimapp3", @"Juniorsimapp4"];

    
    // Do any additional setup after loading the view.
    _datasource =[[DataSource alloc]initWithItems:@[@[@"Intro to Sim",@"Health Informatics",@"Nursing Process",@"Hypoglycemia"],@[@"Postpartum Assessment",@"PPD",@"PEDS Asthma", @"PEDS Growth & Development"]] cellIdentifier:DocumentCellId configureCellBlock:^(UITableViewCell *cell, id item, id indexPath) {
        cell.textLabel.text = item;
        cell.detailTextLabel.text =@"Test";
//        cell.de
    }];
    _datasource.headers =@[@"Junior Year",@"Senior Year"];
    self.tableView.dataSource = _datasource;
    self.tableView.delegate = self;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_documents.count>=indexPath.row){
        NSString * filename = _documents[indexPath.row];
        NSString * bundlePath = [[NSBundle mainBundle]bundlePath];
        NSString * filePath = [bundlePath stringByAppendingPathComponent:filename];
        filePath = [filePath stringByAppendingPathExtension:@"pdf"];

        //load webview
        ATCDetailsWebViewController * details= [self.storyboard instantiateViewControllerWithIdentifier:@"ATCDetailsWebViewController"];
        details.filePath = filePath;
        
        [self.navigationController pushViewController:details animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
