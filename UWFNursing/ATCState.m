//
//  ATCState.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCState.h"
#import <ATCAppDelegate.h>
#import "ATCBeaconNetworkUtilities.h"

@interface ATCState() <UINavigationControllerDelegate>
    @property(nonatomic,strong) UIBarButtonItem * logoutButton;
    @property(nonatomic,strong) ATCBeaconNetworkUtilities *networkUtilities;

    @property(nonatomic,strong) NSMutableArray * sinkProximityEvents;
    @property(nonatomic,strong) NSMutableArray * roomProximityEvents;
    @property(nonatomic,strong) NSMutableArray * patientsProximityEvents;

    @property(nonatomic,strong) NSMutableArray * sinkRegionEvents;
    @property(nonatomic,strong) NSMutableArray * roomRegionEvents;
    @property(nonatomic,strong) NSMutableArray * patientsRegionEvents;


@end

@implementation ATCState

#pragma mark event hadlers
/**Register events*/
-(void)registerSinkProximityEvent:(NSInteger)proximity;{
    [self insertElement: @{@"date":[NSDate new],@"proximity":@(proximity)} into:self.sinkProximityEvents];
}

-(void)registerPatientProximityEvent:(NSInteger)proximity;{
    [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity)} into:self.patientsProximityEvents];
}

-(void)registerRoomProximityEvent:(NSInteger)proximity;{
    [self insertElement:@{@"date":[NSDate new],@"proximity":@(proximity)} into:self.roomProximityEvents];
}

-(void)registerSinkRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region)} into:self.sinkRegionEvents];
}

-(void)registerPatientRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region)} into:self.patientsRegionEvents];
}

-(void)registerRoomRegionEvent:(NSInteger)region;{
    [self insertElement:@{@"date":[NSDate new],@"state":@(region)} into:self.roomRegionEvents];
}

-(void)insertElement:(id)element into:(NSMutableArray *)array{
    if(array.count<10){
        [array addObject:element];
    }
    else{
        [array removeObjectAtIndex:0];
        [array addObject:element];
    }
    [self showWarning];
}
#pragma mark end event hadlers

-(id)init{
    if(self = [super init])
    {
        //init arrays
        _sinkProximityEvents = [NSMutableArray new];
        _patientsProximityEvents = [NSMutableArray new];
        _roomProximityEvents = [NSMutableArray new];
        
        _sinkRegionEvents = [NSMutableArray new];
        _patientsRegionEvents = [NSMutableArray new];
        _roomRegionEvents = [NSMutableArray new];
        
        
        //add notifications
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginNotification:) name:@"LOGIN" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logoutNotification:) name:@"LOGOUT" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseNotification:) name:@"NURSE_STATUS" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseScanNotification:) name:@"BARCODE_SCAN" object:nil];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nurseOverrideNotification:) name:@"NURSE_OVERRIDE" object:nil];
        

        ATCAppDelegate * delegate =   [[UIApplication sharedApplication]delegate];
        UINavigationController * nav = (UINavigationController *) delegate.window.rootViewController;
        nav.delegate = self;
        
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

}


-(void)nurseScanNotification:(NSNotification *)notification{
    NSString * barcode = [[notification userInfo] valueForKey:@"barcode"];
    [_networkUtilities scanBarcode:barcode.integerValue userId:self.nurse sessionId:self.session withCompletionHandler: ^(NSError *error) {
        
    }];
}



-(BOOL)loggedIn{
    return self.nurse!=0;
}




-(BOOL)logic{

    //where I am at?
    //get last current enter region?
    NSDictionary * lastSink = [[self.sinkRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
    NSDictionary * lastBed = [[self.patientsRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];
    NSDictionary * room = [[self.roomRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@)",@1]]lastObject];

//    NSDictionary * room = [[self.roomRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@) OR (state==%@)",@1, @2]]lastObject];

    
    //does it matter?
    //if Im at the patient's bed it means that 
    
    
    
    
    return NO;
}


//main logic of application goes here
-(BOOL)showWarning{

    //get latest washing time
    BOOL warning = NO;
    NSDictionary * dictionary = self.sinkRegionEvents.lastObject;
    //NSDictionary * prDictionary = self.sinkProximityEvents.lastObject;
    
    if(!dictionary)return  NO;
    //get recent proximity events in last minute?
    
    // self.sinkProximityEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(date"]
    //NSMutableArray * avgArray = [NSMutableArray new];
//    __block double avgValue = 0.0;
//    __block double total = 0.0;
//   
//    /*
//    [self.sinkProximityEvents enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL *stop) {
//        if([[NSDate new] timeIntervalSinceDate:[dict objectForKey:@"time"]]<60){
//            avgValue =   avgValue + [[dict objectForKey:@"proximity"]doubleValue];
//            total++;
//        }
//    }];
//    */
//    
//    
//    avgValue = avgValue/total;
//    NSLog(@"avgValue");

    
   

    
    
    if([[dictionary objectForKey:@"state"]integerValue] == CLRegionStateInside){ //is user still there?
        
    }
    else{//any other value indicates the last time when user was next to the sink. Also we can try to calculate the total time he/she spent there

        
       __block NSDictionary * lastDict;
        [self.sinkRegionEvents enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL *stop) {
            if([[NSDate new] timeIntervalSinceDate:[dict objectForKey:@"time"]]<600){
                lastDict = dict;
            }
        }];
        
        if(lastDict!=NULL){
            //check for latest entrance to the region
           // self.sinkRegionEvents fil
            NSDate *entranceDate = [lastDict objectForKey:@"date"];
            NSDictionary * dictionary = [[self.sinkRegionEvents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(state==%@) OR (state==%@) AND (date>%@)",@1, @0,entranceDate]]lastObject];
            //get time at the sink
            if(dictionary){
                NSDate * leftDate = [dictionary objectForKey:@"date"];
                NSInteger timeAtSink =[leftDate timeIntervalSinceDate:entranceDate];
                
                //last time at the sink is: timeAtSink
                NSLog(@"Time at sink %d",timeAtSink);
            }
            
            
        }
        else{
            warning = YES;
        }
    }
    
    
    //if([date timeIntervalSinceNow])
    
    //get average time of hand washing
    
    //get time between hand washing and approaching the patient's bed
    
    //get time between leaving the room and leaving patient's bed
    
    //if that time is in the limits display warning.
    
    return  NO;
}






@end
