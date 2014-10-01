//
//  ATCPatient.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/30/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//
@interface ATCPatient:NSObject
@property (nonatomic,strong) NSString * pid;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * lastname;
@property (nonatomic,strong) NSString * dob;
@property(nonatomic,strong) UIImage * icon;

#warning add more fields


@end
