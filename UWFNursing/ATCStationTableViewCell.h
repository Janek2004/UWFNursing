//
//  ATCStationTableViewCell.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 4/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATCStationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
-(void)setProgress:(double)progress;

@end
