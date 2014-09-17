//
//  Utilities.m
//  Lecture Capture
//
//  Created by DJMobile INC on 8/8/12.
//
//
@import AudioToolbox;
#import "Utilities.h"
@interface Utilities()
{
       SystemSoundID mBeep;
}

@end



@implementation Utilities

-(void)loadSound;{
    NSString* path = [[NSBundle mainBundle]
                      pathForResource:@"low_power" ofType:@"wav"];
    NSURL* url = [NSURL fileURLWithPath:path];
    OSStatus status =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &mBeep);
    NSLog(@"Status %d",(int)status);
}

-(void)playSystemSoundWithMessage:(NSString *)message;{
 
    AudioServicesPlaySystemSound(mBeep);
    //AudioServicesDisposeSystemSoundID(mBeep);
}



+(void)showNotificationWithMessage:(NSString *)message {
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [NSDate new];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.alertBody = message;
    
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
}



+(NSString* ) timeConverter:(int)durationInSeconds{
    NSString * durationText;
    
    if(durationInSeconds>= 60&&durationInSeconds<3600)
    {
        int minutes = durationInSeconds/60;
        int seconds = durationInSeconds%60;
        if(minutes<10)
        {
            if(seconds<10)
            {
                durationText=[NSString stringWithFormat:@"00:0%d:0%d",minutes,seconds];
            }
            else{
                durationText=[NSString stringWithFormat:@"00:0%d:%d",minutes,seconds];
                
            }
        }
        else{
            if(seconds<10)
            {
                durationText=[NSString stringWithFormat:@"00:%d:0%d",minutes,seconds];
            }
            else{
                durationText=[NSString stringWithFormat:@"00:%d:%d",minutes,seconds];
            }
        }
        
    }
    if(durationInSeconds<60)
    {
        
        int seconds = durationInSeconds%60;
        if(seconds<10)
        {
            durationText=[NSString stringWithFormat:@"00:00:0%d", seconds];
        }
        else{
            durationText=[NSString stringWithFormat:@"00:00:%d", seconds];
        }
    }
    if(durationInSeconds>3600)
    {
        int hours= durationInSeconds/3600;
        int minutes = durationInSeconds%3600;
        int seconds = durationInSeconds%60;
        //=[NSString stringWithFormat:@"%d:%d:%d",hours,minutes,seconds];
        if(minutes<10)
        {
            if(seconds<10)
            {
                durationText=[NSString stringWithFormat:@"%d:0%d:0%d",hours,minutes,seconds];
            }
            else{
                durationText=[NSString stringWithFormat:@"%d:0%d:%d",hours,minutes,seconds];
                
            }
        }
        else{
            if(seconds<10)
            {
                durationText=[NSString stringWithFormat:@"%d:%d:0%d",hours,minutes,seconds];
            }
            else{
                durationText=[NSString stringWithFormat:@"%d:%d:%d",hours,minutes,seconds];
            }
        }
        
        
    }
    return durationText;
}

@end
