//
//  ATCStationViewController.m
//  UWFNursing
//
//  Created by sadmin on 11/1/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCStationViewController.h"
#import "ATCStation.h"

@interface ATCStationViewController ()
@property (strong, nonatomic) IBOutlet UILabel *stationTitle;
@property (strong, nonatomic) IBOutlet UIImageView *stationImage;

@end

@implementation ATCStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(_station){
        self.stationTitle.text = self.station.title;
        self.stationImage.image = self.station.image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStation:(ATCStation *)station{
    _station = station;
    self.stationTitle.text = self.station.title;
    self.stationImage.image = self.station.image;

}


@end
