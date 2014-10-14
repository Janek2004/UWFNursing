//
//  ATCWarningViewController.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/13/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCWarningViewController.h"

@implementation ATCWarningViewController

- (IBAction)dismissWarning:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NURSE_OVERRIDE" object:nil];
    
    [self dismissViewControllerAnimated:YES completion:^{
        //post notification
        
        
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
