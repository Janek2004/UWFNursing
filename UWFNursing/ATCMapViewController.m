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
@end

@implementation ATCMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _delegate = [[UIApplication sharedApplication]delegate];
    
    [_delegate.state addObserver:self forKeyPath:@"events" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSArray * array =  [change objectForKey:NSKeyValueChangeNewKey];
   
    NSDictionary * dict = [array lastObject];
    NSInteger type =[[dict objectForKey:@"type"]integerValue];
    
    switch (type) {
        case kbed:{
          
          self.roomLabel.text= @"Bed";
        
          break;
        }
        case ksink:{
            self.roomLabel.text= @"Sink";
            
            break;
        }
        case kbriefing:{
         //get last ten events if none of them contains bed sink or briefing than we know where the user 
            self.roomLabel.text= @"Briefing Room";
            break;
        }
        case kroom:{
        //last room??\
        
        NSArray * beds = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbed)]];
        NSArray * sinks = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(ksink)]];
            
            //check last proximity in last 5 seconds
            NSDictionary * dict =  [sinks lastObject];
            if([dict objectForKey:@"proximity"]){
                NSInteger proximity =[[dict objectForKey:@"proximity"] integerValue];
                NSDate * date = [dict objectForKey:@"date"];
                NSDate * now = [NSDate new];
                NSInteger diff = [now timeIntervalSinceDate:date];

                if(proximity!=0 && diff<5 ){
                      self.roomLabel.text= @"O Sink";
                      return;
                
                }
                
            }
            
             self.roomLabel.text = @"Room";
            
            
            
            break;}
        default:
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
