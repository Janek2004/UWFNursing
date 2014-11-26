/**
 Model of ATC Beacon class. Help to wrap a json coming from web service
 
 */
#import <Foundation/Foundation.h>

enum beacontype{kbed=1,kroom=2,kbriefing=3,ksink=4,koverride=5,kunknown=6};

@interface ATCBeacon : NSObject
    @property(nonatomic,strong) NSString * identifier;
    @property(nonatomic,strong) NSNumber * major;
    @property(nonatomic,strong) NSNumber * minor;
    @property(nonatomic,strong) NSString * iOSidentifier;
    @property(nonatomic) enum beacontype type;

    +(NSString*)hashedBeacon:(NSString *)identifier major:(NSInteger)major minor:(NSInteger)minor;
    -(NSString*)hashedBeacon;
@end
