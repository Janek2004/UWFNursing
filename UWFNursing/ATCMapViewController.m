//
//  ATCMapViewController.m
//  UWFNursing
//
//  Created by sadmin on 10/16/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCMapViewController.h"
#import "ATCAppDelegate.h"
#import  "ATCState.h"
#import  "ATCBeacon.h"

@interface ATCMapViewController ()
@property (strong, nonatomic) IBOutlet UILabel *roomLabel;
    @property(nonatomic,strong)ATCAppDelegate *delegate;
@property (strong, nonatomic) IBOutlet UIImageView *mapImageView;


@end

@implementation ATCMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _delegate = [[UIApplication sharedApplication]delegate];
    
    [_delegate.state addObserver:self forKeyPath:@"location" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    @try {
         [_delegate.state removeObserver:self forKeyPath:@"location"];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@",exception);
    }
    @finally {
        
    }
    
   
}

///**PRoximity Check */
//-(BOOL)proximityCheck:(NSDictionary *)dict{
//    if([dict objectForKey:@"proximity"]){
//        NSInteger proximity =[[dict objectForKey:@"proximity"] integerValue];
//        NSDate * date = [dict objectForKey:@"date"];
//        NSDate * now = [NSDate new];
//        NSInteger diff = [now timeIntervalSinceDate:date];
//        
//        if(proximity!=0 && diff<10 ){
//            return YES;
//        }
//    }
//    return NO;
//
//}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSInteger type =  [[change objectForKey:NSKeyValueChangeNewKey]integerValue];
   
//    NSDictionary * dict = [array lastObject];
// NSInteger type =[[dict objectForKey:@"type"]integerValue];
    
    switch (type) {
        case kbed:{
          
          self.roomLabel.text= @"Bed";
            self.mapImageView.image = [UIImage imageNamed:@"bedside"];
          break;
        }
        case ksink:{
            self.roomLabel.text= @"Sink";
            self.mapImageView.image = [UIImage imageNamed:@"sink"];
            
            break;
        }
        case kbriefing:{
            self.mapImageView.image = [UIImage imageNamed:@"briefing_room"];

            self.roomLabel.text= @"Briefing Room";
            break;
        }
        case kroom:{
       
        
//        NSArray * beds = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbed)]];
//        NSArray * sinks = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(ksink)]];
//            
//            //check last proximity in last 5 seconds
//            if([self proximityCheck: [sinks lastObject]]){
//                self.roomLabel.text = @"Sink";
//                self.mapImageView.image = [UIImage imageNamed:@"sink"];
//
//                return;
//            }
//            //check last proximity in last 5 seconds
//            if([self proximityCheck: [beds lastObject]]){
//                self.roomLabel.text = @"Bed";
//                self.mapImageView.image = [UIImage imageNamed:@"bedside"];
//
//                return;
//            }
            self.mapImageView.image = [UIImage imageNamed:@"simlab"];
            
            self.roomLabel.text = @"Room";
            
            break;}
        default:
            self.mapImageView.image = nil;//[UIImage imageNamed:@"simlab"];
            self.roomLabel.text = @"Unknown";
            break;
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
