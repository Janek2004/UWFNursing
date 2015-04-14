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
#import "Utilities.h"

#import "ATCWarningViewController.h"
#import "JMCBeaconManager.h"
#import "ATCBeaconContentManager.h"
#define OVERRIDE 120

@interface ATCState() <UINavigationControllerDelegate>{
    BOOL warningOnScreen;
    // BOOL ready;
}
@property(nonatomic,strong) UIBarButtonItem * logoutButton;
@property(nonatomic,strong) ATCBeaconNetworkUtilities *networkUtilities;
@property(nonatomic,strong) ATCAppDelegate * delegate;
@property(nonatomic,strong) NSMutableArray * sinkProximityEvents;
@property(nonatomic,strong) NSMutableArray * roomProximityEvents;
@property(nonatomic,strong) NSMutableArray * patientsProximityEvents;
@property(nonatomic,strong) NSMutableArray * briefingProximityEvents;

@property(nonatomic,strong) NSMutableArray * sinkRegionEvents;
@property(nonatomic,strong) NSMutableArray * roomRegionEvents;
@property(nonatomic,strong) NSMutableArray * briefingRegionEvents;
@property(nonatomic,strong) NSMutableArray * patientsRegionEvents;
@property (nonatomic,strong) NSMutableArray * proximityEvents;

@property(nonatomic,strong) UINavigationController * nav;
@property (nonatomic,strong) ATCWarningViewController * warningVC;
@property(nonatomic, strong) NSDate * lastOverride;

@property(nonatomic,strong) UINavigationController * navigationController;

@property (nonatomic,strong) Utilities * utils;
@end

@implementation ATCState


#pragma mark event hadlers
-(void)registerRegionEvent:(ATCStation*)beacon andState:(CLRegionState)state;
{
    self.regionEvents= [self insertElement:@{@"date":[NSDate new],@"state":@(state),@"type": @(beacon.type)} into:self.regionEvents];
    
    switch (beacon.type) {
        case kbed:{
            self.patientsRegionEvents = [self insertElement:@{@"date":[NSDate new],@"state":@(state),@"type": @(beacon.type)} into:self.patientsRegionEvents];
            break
            ;}
        case kroom:{
            self.roomRegionEvents = [self insertElement:@{@"date":[NSDate new],@"state":@(state),@"type": @(beacon.type)} into:self.roomRegionEvents];
            
            if(state == CLRegionStateOutside||state == CLRegionStateUnknown){
                //[strongSelf.contentManager removeAll];
            }
            break;
        }
        case ksink:{
            self.sinkRegionEvents = [self insertElement:@{@"date":[NSDate new],@"state":@(state),@"type": @(beacon.type)} into:self.sinkRegionEvents];
            
            break;}
        case kbriefing:{
            self.briefingRegionEvents = [self insertElement:@{@"date":[NSDate new],@"state":@(state),@"type": @(beacon.type)} into:self.briefingRegionEvents];
            break;
        }
        default:
            break;
    }
    
    
    
    
}


-(void)registerProximity:(ATCBeacon*)beacon  andProximity:(CLProximity)proximity{
    
    
    self.proximityEvents= [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(beacon.type) } into:self.proximityEvents];
    
    switch (beacon.type) {
        case kbed:{
            self.patientsProximityEvents = [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(kbed) } into:self.patientsProximityEvents];
            
            break;}
        case kroom:{
            self.roomProximityEvents =  [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kroom)} into:self.roomProximityEvents];
            
            break;}
        case ksink:{
            self.sinkProximityEvents =  [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity),@"type":@(ksink) } into:self.sinkProximityEvents];
            NSLog(@"Sink Proximity");
            
            break;}
        case kbriefing:{
            self.briefingProximityEvents = [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity),@"type": @(kbriefing)} into:self.briefingProximityEvents];
            break;}
        default:
            break;
    }
}

/** Helper method that inserts elements on the end of the array. Custom application of queue*/
-(NSMutableArray *)insertElement:(NSDictionary *) element into:(NSMutableArray *)array{
    
    NSMutableArray * temp = [array mutableCopy];
    if(temp.count<5000){
        [temp addObject:element];
        
    }
    else{
        
        [temp removeObjectAtIndex:0];
        [temp addObject:element];
    }
    
    return temp;
}

#pragma mark end event hadlers


#pragma mark navigation controller
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //check for warnings.
    //[self.navigationController.navigationBar setTintColor:[UIColor orangeColor]];
    // [self.navigationController.navigationBar setBackgroundColor:[UIColor orangeColor]];
    // [self.navigationController.navigationBar setBarTintColor :[UIColor orangeColor]];
    // self.navigationController.navigationBar setBackgroun
    // self.navigationController.navigationBar.barStyle = [UIBarSt]
    //  ready = YES;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.navigationController = navigationController;
    
    UIToolbar * toolbar = [[UIToolbar alloc]init];
   // UIBarButtonItem * item = [UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>
    [toolbar setItems:@[]];
    if(_session !=0){
        viewController.navigationItem.rightBarButtonItem =self.logoutButton;
    }
    else{
        viewController.navigationItem.rightBarButtonItem = nil;
    }
}
#pragma mark end of navigation controller

/**Registers Beacons */
-(void)registerBeacons:(NSArray *) beacons{

	for(ATCBeacon * beacon in beacons){
		if([beacon isKindOfClass:[ATCBeacon class]]){
			[ _delegate.beaconManager registerRegionWithProximityId:beacon.identifier  andIdentifier:beacon.iOSidentifier    major:beacon.major.intValue   andMinor:beacon.minor.intValue];
		}
    }
}

/**Default Initializer*/
-(id)init{
    if(self = [super init])
    {
        [self setup];
        warningOnScreen = NO;
        self.warningStatus = kAllWarnings;
        _utils = [[Utilities alloc]init];
        [_utils loadSound];


        //add notifications
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginNotification:) name:@"LOGIN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutNotification:) name:@"LOGOUT" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseNotification:) name:@"NURSE_STATUS" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseScanNotification:) name:@"BARCODE_SCAN" object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseOverrideNotification:) name:@"NURSE_OVERRIDE" object:nil];
        
       _delegate =   [[UIApplication sharedApplication]delegate];
        NSArray * beacons =  [[_delegate.contentManager getBeacons]allValues];
		
        [self registerBeacons:beacons];
        
        _nav = (UINavigationController *) _delegate.window.rootViewController;
        _nav.delegate = self;
        _warningVC =  [_nav.topViewController.storyboard instantiateViewControllerWithIdentifier:@"ATCWarningViewController"];
        _logoutButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
        _networkUtilities = [[ATCBeaconNetworkUtilities alloc]init];
        
    }
    return self;
}




/** Resets evars to default values*/
-(void)setup{
    _sinkProximityEvents = [NSMutableArray new];
    _patientsProximityEvents = [NSMutableArray new];
    _roomProximityEvents = [NSMutableArray new];
    _briefingProximityEvents = [NSMutableArray new];
    
    _sinkRegionEvents = [NSMutableArray new];
    _patientsRegionEvents = [NSMutableArray new];
    _roomRegionEvents = [NSMutableArray new];
    _briefingRegionEvents = [NSMutableArray new];
    
    _regionEvents = [NSMutableArray new];
    _proximityEvents = [NSMutableArray new];
    
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


-(BOOL)loggedIn{
    return self.user!=0;
}


#pragma mark notifications

/**Log in notification*/
-(void)loginNotification:(NSNotification *)notification{
    _user =  [[[notification userInfo] valueForKey:@"user"]integerValue];
    _session =  [[[notification userInfo] valueForKey:@"session"]integerValue];
    _warningStatus =[[[notification userInfo] valueForKey:@"warning_state"]integerValue];
    
    _sinkProximityEvents = [NSMutableArray new];
    _patientsProximityEvents = [NSMutableArray new];
    _roomProximityEvents = [NSMutableArray new];
    
    _sinkRegionEvents = [NSMutableArray new];
    _patientsRegionEvents = [NSMutableArray new];
    _roomRegionEvents = [NSMutableArray new];
    
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
    [delegate.beaconManager startMonitoring];
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
    //update the sequence with a false object kovveride
    [self updateSequence:self.sequence WithLocation:koverride];
    
    [_warningVC.view removeFromSuperview];
    warningOnScreen = NO;
}


-(void)nurseScanNotification:(NSNotification *)notification{
    NSString * barcode = [[notification userInfo] valueForKey:@"barcode"];
    
    [_networkUtilities scanBarcode:barcode.longLongValue userId:self.user sessionId:self.session withCompletionHandler: ^(NSError *error) {
        
    }];
}


#pragma mark end of notifications

/** Shows warning on the screen */
-(void)showWarning:(BOOL)show{
    if(show){
        if(!warningOnScreen){
            @try {
                ATCAppDelegate * del = [[UIApplication sharedApplication]delegate];
                [del.networkManager showWarning:self.session andNurse:self.user];
                
            }
            @catch (NSException *exception) {
                NSLog(@"%@",exception.debugDescription);
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

/**Updates the sequence */
-(void)updateSequence:(NSMutableArray *)sequence WithLocation:(NSInteger )location {
    if(location == kroom||location == kunknown) return;
    
    NSMutableArray * tempArray = [sequence mutableCopy];
    //get last object
    NSDictionary * last = sequence.lastObject;
    if(!last){
        [tempArray addObject:@{@"type":@(location)}];
        self.sequence = tempArray;
        return;
    }
    
    if([[last objectForKey:@"type"]integerValue] != location){
        [tempArray addObject:@{@"type":@(location)}];
         self.sequence = tempArray;
    }
}


-(void)showPositive{
    if(self.warningStatus == kPositiveWarnings || self.warningStatus== kAllWarnings){
        self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    }
}

-(void)showNegative{
    if(self.warningStatus == kNegativeWarnings||self.warningStatus== kAllWarnings){
        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    }
}

-(void)showNeutral{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}



/** Analyzes proximit events and estimates duration of the event */
-(NSInteger)checkDurationOfEvent:(NSInteger )type inEvents:(NSArray *)proximityEvents{
   
    NSArray * lastEvents = [proximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary * evaluatedObject, NSDictionary *bindings) {
     //   NSDate * edate = [evaluatedObject objectForKey:@"date"];
        NSInteger proximity =[[evaluatedObject objectForKey:@"proximity"] integerValue];
        //  NSInteger diff = [[NSDate new] timeIntervalSinceDate:edate];
        if([[evaluatedObject objectForKey:@"type"] isEqual:@(type)] && proximity != CLProximityUnknown)return  YES;
        return NO;
        
    }]];
    
    NSDate * currentEvent = nil;
    NSDate * lastEvent = [lastEvents.lastObject objectForKey:@"date"];

    for(NSInteger i=lastEvents.count-1; i>0;i--){

        currentEvent = [lastEvents[i] objectForKey:@"date"];
        NSDate * previousEvent = [lastEvents[i-1] objectForKey:@"date"];
        //get the difference
        if([currentEvent timeIntervalSinceDate:previousEvent]>3){
            break;
        }
    }
    return [lastEvent timeIntervalSinceDate:currentEvent];
}


/**Main logic of the application. Based on beacon passed to it and information about last event and sequence determines if we should display warning or not
 
 @param beacon beacon that is currently found
 @return Yes if we don't want to display or NO if want to display the warning
 */
-(BOOL)logicFor:(ATCBeacon *)beacon{
    
    //check latest location before updating the sequence
    self.location = [self locationCheckForProximityEvents:self.proximityEvents andDate:[NSDate new]];
    
    if(self.location != ksink)
    {
        [self updateSequence:self.sequence WithLocation:self.location];
    }
    if(beacon.type == ksink){
        //check duration
        NSInteger duration = [self checkDurationOfEvent:ksink inEvents:self.proximityEvents];
        NSLog(@"Duration %ld",(long)duration);
        if(duration==15||duration==14){
            if(self.warningStatus == kAllWarnings ||kPositiveWarnings){
                [_utils playSystemSoundWithMessage:@"You can stop now."];
            }
        
        }
        
        if(duration>15){
            [self updateSequence:self.sequence WithLocation:ksink];
            [self showPositive];
        }
        return YES;
    }
    
    NSInteger  lastEvent =[self  getLastEventBefore: self.location];
    
    switch (self.location) {
        case kbed:{
            NSLog(@"You are at the bedside");
            if(self.sequence.count > 1){
                //shows positive response
                if(lastEvent==ksink)
                {
                    [self showPositive];

                    return YES;
                }
                
                //shows negative response
                if(lastEvent != ksink || lastEvent !=koverride||lastEvent == kbriefing)
                {
                    //we need to return no since user didn't go to wash hands prior to going to the bedside
                    //[self showWarning:YES];
                    [self showNegative];
                    NSLog(@"Last event is not sink");
                    return  NO;
                }
                else{
                    
                   // [self showWarning:NO];
                    [self showPositive];
                    return  YES;
                }
            }

//          [self showWarning:YES];
            [self showNegative];
            return  YES;
            break;
        
        }
        case ksink:{
            NSLog(@"You are at the sink. Make sure that you wash your hands properly");
         
           // [self showWarning:NO];
            return  YES;
            break;
        }
        case kbriefing:{

            //show positive feedback
            if(lastEvent==ksink)
            {
                [self showPositive];
                return YES;
            }

            if(self.sequence.count > 1){
                
              //  NSLog(@"Sequence %@",self.sequence);

                //shows positive response
                if(lastEvent != ksink || lastEvent !=koverride){
                    //[self showWarning:YES];
                    [self showNegative];
                    NSLog(@"Briefing Last event is not sink");
                    return  NO;
                }
                else{
                    [self showPositive];
                    //[self showWarning:NO];
                    return YES;

                }
        }
            else{
                [self showPositive];
                return YES;
                
            }
            
         
           
            break;
        }
        case kroom: //no action don't display anything
            [self showNeutral];
            
            break;
            return  YES;
            
        default:{
            [self showNeutral];
            return YES;
            
            break;
        }
    }
    
    
    
    return  YES;
}

/**Get Last Event Before */
-(NSInteger )getLastEventBefore:(NSInteger )room{
    
    if([[[self.sequence lastObject] objectForKey:@"type"]integerValue] == room){
        //get the last event
        for(NSInteger index = self.sequence.count-1; index>=0; index--){
            NSDictionary * suspect = self.sequence[index];
            NSInteger type = [[suspect objectForKey:@"type"]integerValue];
            
            //thats not relevant for our calculations and signal can be picked up from a lot of different places
            
            //|| type == kbriefing
            if(type == kroom ) continue;
            
            //we are interested if user before getting to patient's bed washed hands or before getting debriefing room.
            //Therefore we are looking for either bed or sink as previous event
            
            if(type!=room){
                
                return type;
                break;
            }
        }
        
    }
    else{
        return [[self.sequence.lastObject objectForKey:@"type"]integerValue];
    }
    return -1;
}


/**Location Check*/
-(NSInteger)locationCheckForProximityEvents:(NSArray *)proximityEvents andDate:(NSDate *)date{
    
    NSInteger timeDelta = 5; // time in seconds to be evaluated
    NSInteger numberOfEvents = 40;
    
    NSArray * lastEvents = [proximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary * evaluatedObject, NSDictionary *bindings) {
        NSDate * edate = [evaluatedObject objectForKey:@"date"];
        
        NSInteger proximity =[[evaluatedObject objectForKey:@"proximity"] integerValue];
        NSInteger diff = [date timeIntervalSinceDate:edate];
        
        if(diff<timeDelta&&(proximity!=CLProximityUnknown)){
            return  YES;
        }
        return NO;
    }]];
    
    //we are returning -1
    if(lastEvents.count == 0) return kunknown;
    
    NSInteger first= lastEvents.count <numberOfEvents ? 0:lastEvents.count-numberOfEvents;
    NSInteger count =lastEvents.count > numberOfEvents? numberOfEvents:lastEvents.count;

    NSArray * lastTen = [lastEvents subarrayWithRange: NSMakeRange(first,count)];
    
    
    NSArray * beds = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbed)]];
    
    NSMutableArray  * tempBeds = [NSMutableArray new];
    for(NSDictionary * bed in beds)
    {
        if([[bed objectForKey:@"proximity"] isEqual:@(CLProximityNear)]){
            [tempBeds addObject: bed];
        }
    }
    beds = tempBeds;
    
    NSArray * sinks = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(ksink)]];
    NSMutableArray  * tempSinks = [NSMutableArray new];
    for(NSDictionary * sink in sinks)
    {
        if([[sink objectForKey:@"proximity"] isEqual:@(CLProximityNear)]||[[sink objectForKey:@"proximity"] isEqual:@(CLProximityImmediate)]){
            [tempSinks addObject: sink];
        }
    }
    sinks = tempSinks;
    
    NSArray * briefings = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kbriefing)]];
    NSArray * simlabs = [lastTen filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(type==%@)",@(kroom)]];
    
    if(beds.count >0 && beds.count>= (count -1)/2){
        return kbed;
    }
    
    if(sinks.count>0 && sinks.count >= (count-1)/2){
        return ksink;
    }
    
    if(briefings.count > 0 && briefings.count > count/2){
        return kbriefing;
    }
    
    if(simlabs.count>0 && simlabs.count > count/2){
        return kroom;
    }
    
    
    return kunknown;
}


@end
