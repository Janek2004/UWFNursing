//
//  Utilities.h
//  Lecture Capture
//
//  Created by DJMobile INC on 8/8/12.
//
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
+(NSString* ) timeConverter:(int)durationInSeconds;
-(void)loadSound;
-(void)playSystemSoundWithMessage:(NSString *)message;

@end
