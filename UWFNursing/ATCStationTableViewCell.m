//
//  ATCStationTableViewCell.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 4/13/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

#import "ATCStationTableViewCell.h"

@implementation ATCStationTableViewCell
-(void)setProgress:(double)progress;{
	[self.progressView setProgress:progress animated:YES];
	[self.contentView addSubview:self.progressView];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	[self.contentView addSubview:self.progressView];
	
	
	
	
	return self;
}

@end
