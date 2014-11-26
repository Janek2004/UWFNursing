//
//  ATCState.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCState.h"
#import "ATCAppDelegate.h"
#import "ATCBeaconNetworkUtilities.h"
#import "ATCBeacon.h"
#import "ATCStation.h"

#import "ATCWarningViewController.h"
#import "JMCBeaconManager.h"
#import "ATCBeaconContentManager.h"

@interface ATCState() <UINavigationControllerDelegate>{
    BOOL warningOnScreen;
    BOOL ready;
    
}
    @property(nonatomic,strong) UIBarButtonItem * logoutButton;
    @property(nonatomic,strong) ATCBeaconNetworkUtilities *networkUtilities;

    @property(nonatomic,strong) NSMutableArray * sinkProximityEvents;
    @property(nonatomic,strong) NSMutableArray * roomProximityEvents;
    @property(nonatomic,strong) NSMutableArray * patientsProximityEvents;
    @property(nonatomic,strong) NSMutableArray * briefingProximityEvents;

    @property(nonatomic,strong) NSMutableArray * sinkRegionEvents;
    @property(nonatomic,strong) NSMutableArray * roomRegionEvents;
    @property(nonatomic,strong) NSMutableArray * briefingRegionEvents;
    @property(nonatomic,strong) NSMutableArray * patientsRegionEvents;

    @property (nonatomic,strong) NSMutableArray * sequence;
    @property (nonatomic,strong) NSMutableArray * proximityEvents;

    @property(nonatomic,strong) UINavigationController * nav;
    @property (nonatomic,strong) ATCWarningViewController * warningVC;
    @property(nonatomic, strong) NSDate * lastOverride;
    @property (nonatomic,strong) NSDate * lastNotification;

//    -(void)registerSinkProximityEvent:(NSInteger)proximity;
//    -(void)registerPatientProximityEvent:(NSInteger)proximity;
//    -(void)registerRoomProximityEvent:(NSInteger)proximity;
//    -(void)registerBriefingRoomProximityEvent:(NSInteger)proximity;

//    -(void)registerSinkRegionEvent:(NSInteger)region;
//    -(void)registerPatientRegionEvent:(NSInteger)region;
//    -(void)registerRoomRegionEvent:(NSInteger)region;
//    -(void)registerBriefingRoomRegionEvent:(NSInteger)region;


@end

@implementation ATCState

-(void)registerRegionEvent:(ATCStation*)beacon andState:(CLRegionState)state;
{
    
    switch (beacon.type) {
        case kbed:{
            [self registerPatientRegionEvent:state];
            break
            
            ;}
        case kroom:{
            [self registerRoomRegionEvent:state];
            if(state == CLRegionStateOutside||state == CLRegionStateUnknown){
                //[strongSelf.contentManager removeAll];
            }
            break;}
        case ksink:{
            
            [self registerSinkRegionEvent:state];
            NSTimeInterval time = [[NSDate new] timeIntervalSinceDate:self.lastNotification];
            if (time> 15||!self.lastNotification) {
                UILocalNotification * notif = [[UILocalNotification alloc]init];
                notif.alertBody =@"Make sure to take care of your hand hygiene.";
                
                [[UIApplication sharedApplication] presentLocalNotificationNow:notif];
                self.lastNotification = [NSDate new];
            }
            break;}
        case kbriefing:{
            [self registerBriefingRoomRegionEvent:state];
            break;
        }
        default:
            break;
    }
}





-(void)registerProximity:(ATCBeacon*)beacon  andProximity:(CLProximity)proximity{
    
    if(beacon){

        [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(beacon.type) } into:self.proximityEvents];
        
        switch (beacon.type) {
            case kbed:{
            [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(ksink) } into:self.sinkProximityEvents];
                
                break;}
            case kroom:{
                 [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kroom)} into:self.roomProximityEvents];
                
                break;}
            case ksink:{
                 [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(ksink) } into:self.sinkProximityEvents];
                NSLog(@"Sink Proximity");
                
                break;}
            case kbriefing:{
                [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kbriefing)} into:self.briefingProximityEvents];
                break;}
            default:
                break;
        }
    }
}


#pragma mark event hadlers //will be deleted later on
/**Register events*/
-(void)registerSinkProximityEvent:(NSInteger)proximity;{
    [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(ksink) } into:self.sinkProximityEvents];
}

-(void)registerPatientProximityEvent:(NSInteger)proximity;{
    
    
    [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(kbed)} into:self.patientsProximityEvents];
}

-(void)registerRoomProximityEvent:(NSInteger)proximity;{
    [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kroom)} into:self.roomProximityEvents];
}

-(void)registerBriefingRoomProximityEvent:(NSInteger)proximity;
{
    [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kbriefing)} into:self.briefingProximityEvents];
}

-(void)registerSinkRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region),@"type": @(ksink)} into:self.sinkRegionEvents];
}

-(void)registerPatientRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region),@"type": @(kbed)} into:self.patientsRegionEvents];
}

-(void)registerRoomRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region),@"type": @(kroom)} into:self.roomRegionEvents];
}

-(void)registerBriefingRoomRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region),@"type": @(kbriefing)} into:self.briefingRegionEvents];
}

-(void)insertElement:(id)element into:(NSMutableArray *)array{
    
    NSMutableArray * temp = [_regionEvents mutableCopy];
    if(temp.count<200){
        if([element objectForKey:@"state"])  {
         [temp addObject:element];
        }
    }
    else{
        if([element objectForKey:@"state"]) {
            [temp removeObjectAtIndex:0];
            [temp addObject:element];
        }
    }
    
    self.regionEvents = [NSArray arrayWithArray:[temp copy]];

    //proximity
    if(array.count<200){
        [array addObject:element];
    }
    else{
        [array removeObjectAtIndex:0];
        [array addObject:element];
    }
   // [self showWarning];
}
#pragma mark end event hadlers

-(id)init{
    if(self = [super init])
    {
        [self setup];
        warningOnScreen = NO;
        
        //add notifications
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginNotification:) name:@"LOGIN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutNotification:) name:@"LOGOUT" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseNotification:) name:@"NURSE_STATUS" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseScanNotification:) name:@"BARCODE_SCAN" object:nil];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseOverrideNotification:) name:@"NURSE_OVERRIDE" object:nil];
        
        ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
        _nav = (UINavigationController *) delegate.window.rootViewController;
        _nav.delegate = self;
       
        
        _warningVC =  [_nav.topViewController.storyboard instantiateViewControllerWithIdentifier:@"ATCWarningViewController"];

        _logoutButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
        
        _networkUtilities = [[ATCBeaconNetworkUtilities alloc]init];
   
    }
    return self;
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //check for warnings.
    
    ready = YES;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    ready = NO;
    if(_session !=0){
        viewController.navigationItem.rightBarButtonItem =self.logoutButton;
    }
    else{
        viewController.navigationItem.rightBarButtonItem = nil;
    }
}

/**Log in notification*/
-(void)loginNotification:(NSNotification *)notification{
    _user =  [[[notification userInfo] valueForKey:@"user"]integerValue];
    _session =  [[[notification userInfo] valueForKey:@"session"]integerValue];
    _sinkProximityEvents = [NSMutableArray new];
    _patientsProximityEvents = [NSMutableArray new];
    _roomProximityEvents = [NSMutableArray new];
    
    _sinkRegionEvents = [NSMutableArray new];
    _patientsRegionEvents = [NSMutableArray new];
    _roomRegionEvents = [NSMutableArray new];
    
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
    [delegate.beaconManager startMonitoring];
}

/** Resets evars to default values*/
-(void)setup{
    _sinkProximityEvents = [NSMutableArray new];
    _patientsProximityEvents = [NSMutableArray new];
    _roomProximityEvents = [NSMutableArray new];
    
    _sinkRegionEvents = [NSMutableArray new];
    _patientsRegionEvents = [NSMutableArray new];
    _roomRegionEvents = [NSMutableArray new];
    
    _regionEvents = [NSArray new];
    _sequence = [NSMutableArray new];

    _user = 0;
    _session = 0;

}

/**Used to logout the user*/
-(void)logout{
   
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
        [delegate.networkManager logoutUser:[NSString stringWithFormat:@"%d",(int)self.session] withCompletionHandler:^(NSError *error) {
        
    }];
    UINavigationController * nav = (UINavigationController *) delegate.window.rootViewController;
    [nav popToRootViewControllerAnimated:YES];
    [delegate.beaconManager stopMonitoring];
    [self setup];
}


/**Log out notification currently unused*/
-(void)logoutNotification:(NSNotification *)notification{
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
    
    [delegate.networkManager logoutUser:[NSString stringWithFormat:@"%d",(int)self.user] withCompletionHandler:^(NSError *error) {
        
    }];
    
    _user = 0;
    _session = 0;
    _primaryNurse = 0;
   
}

/** nurse status notification*/
-(void)nurseNotification:(NSNotification *)notification{
      _primaryNurse =  [[[notification userInfo] valueForKey:@"primary"]integerValue];
    
}

/** nurse override notification */
-(void)nurseOverrideNotification:(NSNotification *)notification{
    //_primaryNurse =  [[[notification userInfo] valueForKey:@"override"]integerValue];
    [_networkUtilities overrideWarningForSession:self.session andNurse:self.user ];
    _lastOverride = [NSDate new];
    [_warningVC.view removeFromSuperview];
    warningOnScreen = NO;
    
    
    
    //[_warningVC dismissViewControllerAnimated:NO completion:nil];
    //_nav pop

}


-(void)nurseScanNotification:(NSNotification *)notification{
    NSString * barcode = [[notification userInfo] valueForKey:@"barcode"];
    
    [_networkUtilities scanBarcode:barcode.longLongValue userId:self.user sessionId:self.session withCompletionHandler: ^(NSError *error) {
        
    }];
}



-(BOOL)loggedIn{
    return self.user!=0;
}

/**
    Currently we are checking region events
*/
-(NSDictionary *)getLastEventBefore:(NSInteger)room{
    
    NSMutableArray * events = [NSMutableArray new];
 
    [events addObjectsFromArray:[self.sinkProximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]];
    [events addObjectsFromArray:[self.patientsProximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]];
    [events addObjectsFromArray:[self.briefingProximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]];
    
    id mySort = ^(NSDictionary * obj1, NSDictionary * obj2){
        return [[obj1 objectForKey:@"date"] compare:[obj2 objectForKey:@"date"]];
    };

    NSArray * sortedEvents = [events sortedArrayUsingComparator:mySort];

    if([[[sortedEvents lastObject] objectForKey:@"type"]integerValue] == room){
        //get the last event
        for(NSInteger index = sortedEvents.count-1; index>=0; index--){
            NSDictionary * suspect = sortedEvents[index];
            if([[suspect objectForKey:@"type"]integerValue]!=room){
                return suspect;
            }
        }
        
    }
    else{
        return sortedEvents.lastObject;
    }
    return nil;
}

-(void)showWarning:(BOOL)show{
    if(show){
        if(!warningOnScreen){
            @try {
                ATCAppDelegate * del = [[UIApplication sharedApplication]delegate];
                [del.networkManager showWarning:self.session andNurse:self.user];
                
            }
            @catch (NSException *exception) {
                
            }
            @finally {
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
                [delegate.window addSubview:_warningVC.view];
                warningOnScreen = YES;
            });
        }
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [_warningVC.view removeFromSuperview];
            warningOnScreen = NO;
            
        });
    }
}


-(BOOL)logicFor:(ATCBeacon *)beacon{
    //where I am at?
    self.location = [self locationCheckForProximityEvents:self.proximityEvents];
    
    
    if([[NSDate new]timeIntervalSinceDate:self.lastOverride]<120 )
    {

        return YES;
    }
    if(self.session == 0){
        return YES;
    }
    
        NSDictionary * lastEvent = [self getLastEventBefore:self.location];
        NSLog(@"Last Event Is %@", lastEvent);
    
        switch (self.location) {
            case kbed:{
                NSLog(@"You are at the bedside");
                    if(lastEvent){
                        if([[lastEvent objectForKey:@"type"]integerValue] != ksink)
                        {
                            //we need to return no since user didn't go to wash hands prior to going to the bedside
                            [self showWarning:YES];
                            NSLog(@"Last event is not sink");
                            return  NO;
                        }
                        else{
                            
                            [self showWarning:NO];
                            return  YES;
                        }
                        
                     }
                        //previous event doesnt exist which means that user never been to sink
                        [self showWarning:YES];
                        return  YES;
                break;}
            case ksink:{
                    NSLog(@"You are at the sink. Make sure that you wash your hands properly");
                    [self showWarning:NO];
                      return  YES;
                  break;
            }
            case kbriefing:{
               // NSLog(@"You are in the briefing room");
                if(lastEvent){
                        if([[lastEvent objectForKey:@"type"]integerValue] != [@(ksink)integerValue])
                        {
                            //we need to return no since user didn't go to wash hands prior to going going back to the debriefing room
                            [self showWarning:YES];
                            NSLog(@"Briefing Last event is not sink");
                            return  NO;
                        }
                        else{
                            [self showWarning:NO];
                            return YES;
                        }
                        
                    }
                    return YES;
                
                break;}
            case kroom: // no action
                [self showWarning:NO];
               // NSLog(@"You are in the room.");
                break;
                return  YES;
            default:
                break;
        }
    return NO;
}


-(NSInteger)checkLocation:(ATCBeacon *)beacon{
    
    switch (beacon.type) {
        case kbed:{
            
            return kbed;
            break;
        }
        case ksink:{
            return ksink;
            break;
        }
        case kbriefing:{
            return kbriefing;
            break;
        }
        case kroom:{
            NSArray * beds = self.patientsProximityEvents;
            NSArray * sinks = self.sinkProximityEvents;
            
            //check last proximity in last 5 seconds
            if([self proximityCheck: [sinks lastObject]]){

                return ksink;
            }
            //check last proximity in last 5 seconds
            if([self proximityCheck: [beds lastObject]]){
                
                
                return kbed;
            }
            return kroom;
            
            break;}
        default:
            
            break;
    }

    
    
    return  -1;
}


/**Location Check*/
-(NSInteger)locationCheckForProximityEvents:(NSArray *)proximityEvents{

    NSArray * lastEvents = [proximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary * evaluatedObject, NSDictionary *bindings) {
        NSDate * date = [evaluatedObject objectForKey:@"date"];
        NSDate * now = [NSDate new];
        NSInteger proximity =[[evaluatedObject objectForKey:@"proximity"] integerValue];
        NSInteger diff = [now timeIntervalSinceDate:date];
        if(diff<5&&(proximity!=CLProximityUnknown)){
            return  YES;
        }
        return NO;
    }]];
    
    
    NSInteger first= lastEvents.count <5 ? 0:lastEvents.count-5;
    NSInteger count =lastEvents.count > 5? 5:lastEvents.count;
    NSArray * lastTen = [lastEvents subarrayWithRange: NSMakeRange(first
                                               , count)  ];
    NSArray * beds = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbed)]];
    NSArray * sinks = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(ksink)]];
    NSArray * briefings = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbriefing)]];
    NSArray * simlabs = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kroom)]];
    
    if(beds.count> count/2){
        return kbed;
    }
    
    if(sinks.count> count/2){
        return kbed;
    }
    
    if(briefings.count> count/2){
        return kbriefing;
    }
    
    if(simlabs.count> count/2){
        return kroom;
    }
    

    return 0;
}


/**Proximity Check */
-(BOOL)proximityCheck:(NSDictionary *)dict{
    if([dict objectForKey:@"proximity"]){
        NSInteger proximity =[[dict objectForKey:@"proximity"] integerValue];
        NSDate * date = [dict objectForKey:@"date"];
        NSDate * now = [NSDate new];
        NSInteger diff = [now timeIntervalSinceDate:date];
        
        if(proximity!=0 && diff<10 ){
            return YES;
        }
    }
    return NO;
}




@end
