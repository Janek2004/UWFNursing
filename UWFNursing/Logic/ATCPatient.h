//
//  ATCPatient.h
//  UWFNursing
//
//  Created by Janusz Chudzynski on 9/30/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//
#import  "ATCStation.h"
//@class ATCStation;
@interface ATCPatient:ATCStation
 @property (nonatomic,strong)  NSString * pid;
 @property (nonatomic,strong)  NSString * name;
 @property (nonatomic,strong)  NSString * lastname;
 @property (nonatomic,strong)  NSString * dob;
 @property (nonatomic,strong)  UIImage * icon;
 @property (nonatomic, strong) NSString * wristbandCode;
 @property (nonatomic,strong)  NSNumber * roomId;
 @property (nonatomic,strong)  NSString * allergies;


@end
