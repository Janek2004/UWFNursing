//
//  ATCWashingHandsStationViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/15/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCWashingHandsStationViewController.h"
#import "Utilities.h"
#define WASHING_TIME 10
@interface ATCWashingHandsStationViewController (){
    NSInteger secondsLeft;
 
}
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UIButton *controlButton;
@property (strong, nonatomic) NSTimer * timer;
@property (strong, nonatomic)  Utilities * utils;
@end

@implementation ATCWashingHandsStationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.controlButton addTarget:self action:@selector(startWashing:) forControlEvents:UIControlEventTouchUpInside];
        secondsLeft  = WASHING_TIME;
        self.timerLabel.text = [NSString stringWithFormat:@"%d",secondsLeft];
    _utils = [[Utilities alloc]init];
    [_utils loadSound];
}

//start washing hands
-(void)startWashing:(UIButton*)sender{
    
    if(![self.timer isValid]){
        _timer =[NSTimer timerWithTimeInterval:1 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
}

-(void)tick:(NSTimer *)timer{
    secondsLeft -- ;
  
    if(secondsLeft == 0){
        //show stop button or just stop?
        [timer invalidate];
        [_utils playSystemSoundWithMessage:@"You can stop now."];
        self.timerLabel.text =@"You can stop now";
        secondsLeft =WASHING_TIME;
        
    }else{
        self.timerLabel.text = [NSString stringWithFormat:@"%d",secondsLeft];
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
