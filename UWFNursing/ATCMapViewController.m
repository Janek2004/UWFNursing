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
        
          break;
        }
        case ksink:{
            
            
            break;
        }
        case kbriefing:{
         //get last ten events if none of them contains bed sink or briefing than we know where the user 
            
            break;
        }
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
