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





/* Briefing room, Bed, Briefing Room
 
 Printing description of self->_proximityEvents:
 <__NSArrayM 0x1782572b0>(
 {
 date = "2014-12-09 18:33:41 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:43 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:44 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:45 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:46 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:47 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:48 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:50 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:51 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:52 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:53 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:54 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:55 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:56 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:57 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:58 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:59 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:00 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:01 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:02 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:03 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:04 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:05 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:06 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:07 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:08 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:11 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:12 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:35 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:36 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:37 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:38 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:39 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:40 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:41 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:42 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:43 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:44 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:45 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:46 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:47 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:48 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:49 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:50 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:51 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:52 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:53 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:54 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:55 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:56 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:58 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:58 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:59 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:00 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:01 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:08 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:12 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:20 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:21 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:22 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:24 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:25 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:26 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:27 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:28 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:29 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:30 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:31 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:33 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:34 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:35 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:36 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:39 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:40 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:41 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:42 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:43 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:44 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:45 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:46 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:47 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:48 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:49 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:50 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:51 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:52 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:53 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:54 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:55 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:56 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:58 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:59 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:00 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:01 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:08 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:12 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:39:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:08 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:12 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:20 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:21 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:22 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:24 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:25 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:26 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:27 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:28 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:29 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:30 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:31 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:32 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:33 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:34 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:35 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:36 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:37 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:39 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:39 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:40 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:40 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:41 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:41 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:42 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:42 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:43 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:43 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:44 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:44 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:23 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:23 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:24 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:24 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:25 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:25 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:26 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:26 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:27 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:27 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:28 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:28 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:29 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:29 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:30 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:30 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:31 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:31 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:39 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:40 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:41 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:42 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:43 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:44 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:47 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:47 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:48 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:48 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:49 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:49 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:50 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:50 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:51 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:51 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:52 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:52 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:53 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:53 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:54 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:54 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:55 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:55 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:56 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:56 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:57 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:57 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:58 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:58 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:59 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:59 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:00 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:00 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:01 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:01 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:02 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:03 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:03 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:04 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:04 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:05 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:05 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:06 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:06 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:07 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:07 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:08 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:11 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:12 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:35 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:36 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:37 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:38 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:39 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:40 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:41 +0000";
 proximity = 2;
 type = 3;
 }
 )
 (lldb)Printing description of self->_proximityEvents:
 <__NSArrayM 0x1782572b0>(
 {
 date = "2014-12-09 18:33:41 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:43 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:44 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:45 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:46 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:47 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:48 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:49 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:50 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:51 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:52 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:53 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:54 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:55 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:56 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:57 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:58 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:33:59 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:00 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:01 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:02 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:03 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:04 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:05 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:06 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:07 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:08 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:11 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:12 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:34:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:35 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:36 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:37 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:38 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:39 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:40 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:41 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:42 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:43 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:44 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:45 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:46 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:47 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:48 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:49 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:50 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:51 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:52 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:53 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:54 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:55 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:56 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:58 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:35:58 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:35:59 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:00 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:01 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:08 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:12 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:20 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:21 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:22 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:24 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:25 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:26 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:27 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:28 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:29 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:30 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:31 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:33 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:34 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:35 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:36 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:39 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:40 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:41 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:42 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:43 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:44 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:45 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:46 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:47 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:48 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:49 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:50 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:51 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:52 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:53 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:54 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:55 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:56 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:57 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:58 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:36:59 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:00 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:01 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:08 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:12 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:37:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:39:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:02 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:03 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:04 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:05 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:06 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:07 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:08 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:09 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:10 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:11 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:12 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:13 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:14 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:15 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:16 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:17 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:18 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:19 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:20 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:21 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:22 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:23 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:24 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:25 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:26 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:27 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:28 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:29 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:30 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:31 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:32 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:33 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:34 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:35 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:36 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:37 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:38 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:39 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:39 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:40 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:40 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:41 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:41 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:42 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:42 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:43 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:43 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:44 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:44 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:47 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:48 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:49 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:50 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:51 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:52 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:53 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:54 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:55 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:56 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:57 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:58 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:40:59 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:00 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:01 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:03 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:04 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:05 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:06 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:07 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:08 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:09 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:10 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:11 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:12 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:13 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:14 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:15 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:16 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:17 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:18 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:19 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:20 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 2;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:21 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:22 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:23 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:23 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:24 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:24 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:25 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:25 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:26 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:26 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:27 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:27 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:28 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:28 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:29 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:29 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:30 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:30 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:31 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:31 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:32 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:33 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:34 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:35 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:36 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:37 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 0;
 type = 1;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:38 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:39 +0000";
 proximity = 2;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:40 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:41 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:42 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:43 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:44 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:45 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:46 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:47 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:47 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:48 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:48 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:49 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:49 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:50 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:50 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:51 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:51 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:52 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:52 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:53 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:53 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:54 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:54 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:55 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:55 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:56 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:56 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:57 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:57 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:58 +0000";
 proximity = 0;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:58 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:41:59 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:41:59 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:00 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:00 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:01 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:01 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:02 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:02 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:03 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:03 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:04 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:04 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:05 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:05 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:06 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:06 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:07 +0000";
 proximity = 3;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:07 +0000";
 proximity = 0;
 type = 2;
 },
 {
 date = "2014-12-09 18:42:08 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:09 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:10 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:11 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:12 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:13 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:14 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:15 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:16 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:17 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:18 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:19 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:20 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:21 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:22 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:23 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:24 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:25 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:26 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:27 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:28 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:29 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:30 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:31 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:32 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:33 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:34 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:35 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:36 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:37 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:38 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:39 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:40 +0000";
 proximity = 2;
 type = 3;
 },
 {
 date = "2014-12-09 18:42:41 +0000";
 proximity = 2;
 type = 3;
 }
 )
 (lldb)
 */