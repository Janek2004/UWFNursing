//
//  ATCBeacon.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/24/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCBeacon.h"

@implementation ATCBeacon
+(NSString*)hashedBeacon:(NSString *)identifier major:(NSInteger)major minor:(NSInteger)minor{
    
    return [NSString stringWithFormat:@"%@%lu%lu",[identifier lowercaseString],(long)major,(long)minor ];
}

@end
