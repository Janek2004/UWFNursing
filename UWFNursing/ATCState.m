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

@interface ATCState() <UINavigationControllerDelegate>{
    BOOL warningOnScreen;
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

 //   @property(nonatomic,strong) ATCAppDelegate * delegate;// =   [[UIApplication sharedApplication]delegate];
    @property(nonatomic,strong) UINavigationController * nav;// = (UINavigationController *) delegate.window.rootViewController
@property (nonatomic,strong) UIViewController * warningVC;



    @property(nonatomic, strong) NSDate * lastOverride;
@end

@implementation ATCState

#pragma mark event hadlers
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
    
    NSMutableArray * temp = [_events mutableCopy];
    if(temp.count<10){
        [temp addObject:element];
    }
    else{
        [temp removeObjectAtIndex:0];
        [temp addObject:element];
    }
    self.events = temp;
    
    if(array.count<10){
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
        _events = [NSArray new];
        //init arrays
        _sinkProximityEvents = [NSMutableArray new];
        _patientsProximityEvents = [NSMutableArray new];
        _roomProximityEvents = [NSMutableArray new];
        
        _sinkRegionEvents = [NSMutableArray new];
        _patientsRegionEvents = [NSMutableArray new];
        _roomRegionEvents = [NSMutableArray new];
        
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

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(_session !=0){
        viewController.navigationItem.rightBarButtonItem =self.logoutButton;
    }
    else{
        viewController.navigationItem.rightBarButtonItem = nil;
    }
}

/**Log in notification*/
-(void)loginNotification:(NSNotification *)notification{
    _nurse =  [[[notification userInfo] valueForKey:@"user"]integerValue];
    _session =  [[[notification userInfo] valueForKey:@"session"]integerValue];
}

/**Used to logout the user*/
-(void)logout{
    [self loginNotification:nil];
    ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
    UINavigationController * nav = (UINavigationController *) delegate.window.rootViewController;
    [nav popToRootViewControllerAnimated:YES];
   
}


/**Log out notification*/
-(void)logoutNotification:(NSNotification *)notification{
    _nurse = 0;
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
    [_networkUtilities overrideWarningForSession:self.session andNurse:self.nurse ];
    _lastOverride = [NSDate new];
     warningOnScreen = NO;
    [_warningVC dismissViewControllerAnimated:NO completion:nil];
    //_nav pop

}


-(void)nurseScanNotification:(NSNotification *)notification{
    NSString * barcode = [[notification userInfo] valueForKey:@"barcode"];
    [_networkUtilities scanBarcode:barcode.integerValue userId:self.nurse sessionId:self.session withCompletionHandler: ^(NSError *error) {
        
    }];
}



-(BOOL)loggedIn{
    return self.nurse!=0;
}

/**
    Currently we are checking region events
*/
-(NSDictionary *)getLastEvent{
    NSDictionary * lastSinkRegion = [[self.sinkRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
    NSDictionary * lastBedRegion = [[self.patientsRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];

    NSDictionary * lastBriefingRoomRegion = [[self.roomRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
    
    NSMutableArray * events = [NSMutableArray new];
    if(lastSinkRegion){
        [events addObject:lastSinkRegion];
    }

    if(lastBedRegion){
        [events addObject:lastBedRegion];
    }

    if(lastBriefingRoomRegion){
        [events addObject:lastBriefingRoomRegion];
    }
    
    id mySort = ^(NSDictionary * obj1, NSDictionary * obj2){
        
        return [[obj1 objectForKey:@"date"] compare:[obj2 objectForKey:@"date"]];
        
    };
    
    NSArray * sortedEvents = [events sortedArrayUsingComparator:mySort];
    NSLog(@"%@",sortedEvents);
    return [sortedEvents lastObject];
}

-(void)showWarning{
    if(!warningOnScreen){
        [_nav.topViewController presentViewController: _warningVC animated:NO completion:^{
            warningOnScreen = YES;
        }];
    }
}

-(BOOL)logicFor:(ATCBeacon *)beacon{
    
    if([[NSDate new]timeIntervalSinceDate:self.lastOverride]<120 )
    {

        return YES;
    }
    if(self.session == 0){
        return YES;
    }
    
    //where I am at?
    //get last current enter region?
//    NSDictionary * lastSinkRegion = [[self.sinkRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
   NSDictionary * lastBedRegion = [[self.patientsRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
//    NSDictionary * lastRoomRegion = [[self.roomRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
//    NSDictionary * lastBriefingRoomRegion = [[self.roomRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
//
  // NSDictionary * sinkProximity = [self.sinkProximityEvents lastObject];
    NSDictionary * debProximity = [self.briefingProximityEvents lastObject];
    NSDictionary * bedProximity = [self.patientsProximityEvents lastObject];
  //  NSDictionary * roomProximity = [self.roomProximityEvents lastObject];
    
    if(beacon){
        switch (beacon.type) {
            case kbed:{
                //if we are close
                NSInteger proximity = [[bedProximity objectForKey:@"proximity"]integerValue] ;
                if(proximity==CLProximityNear||proximity==CLProximityImmediate)
                {

                    NSDictionary * lastEvent =                     [self getLastEvent];
                    if(lastEvent){
                        
                        NSLog(@"LAST EVENT IS %@ %@ %@",lastEvent,lastEvent.allKeys, lastEvent.allValues);
                        
                        NSLog(@"SINK IS why? ??  %@ %d ",[lastEvent objectForKey:@"type"], ksink);
                        if([[lastEvent objectForKey:@"type"]integerValue] != ksink)
                        {
                            //we need to return no since user didn't go to wash hands prior to going to the bedside
                            [self showWarning];
                            NSLog(@"Last event is not sink");
                            return  NO;
                        }
                        else{
                        
                            return YES;
                        }
                        
                    }
                    return YES;
                    
                }
                
                
                break;}
            case ksink:{
                NSLog(@"You are at the sink. Make sure that you wash your hands properly");
                if(warningOnScreen){
                    [_nav popViewControllerAnimated:YES];
                    _nav.navigationBarHidden = NO;
                    warningOnScreen = NO;
                }
                break;}
            case kbriefing:{
                
              //if we are close
                NSInteger proximity = [[debProximity objectForKey:@"proximity"]integerValue] ;
                if(proximity==CLProximityNear||proximity==CLProximityImmediate)
                {
                    
                    NSDictionary * lastEvent =  [self getLastEvent];
                    if(lastEvent){
                        if(([[lastEvent objectForKey:@"type"]integerValue] != [@(ksink)integerValue]) && lastBedRegion  )
                        {
                            //we need to return no since user didn't go to wash hands prior to going going back to the debriefing room
                            [self showWarning];
                            NSLog(@"Last event is not sink");
                            return  NO;
                        }
                        else{
                            
                            return YES;
                        }
                        
                    }
                    return YES;
                    
                }
                
                
                break;}
     
                
    
            case kroom: // no action
                
                    //NSLog(@"You are at the sink. Make sure that you wash your hands properly");
                break;

                
                
            default:
                break;
        }
        
    }




    return NO;
}








@end
