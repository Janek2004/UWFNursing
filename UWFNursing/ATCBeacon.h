/**
 Model of ATC Beacon class. Help to wrap a json coming from web service
 
 */
#import <Foundation/Foundation.h>

enum beacontype{sink,bed,room,briefing};

@interface ATCBeacon : NSObject
    @property(nonatomic,strong) NSString * identifier;
    @property(nonatomic,strong) NSNumber * major;
    @property(nonatomic,strong) NSNumber * minor;
    @property(nonatomic,strong) NSString * iOSidentifier;
    @property(nonatomic) enum beacontype type;

@end
