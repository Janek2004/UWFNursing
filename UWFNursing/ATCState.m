//
//  ATCState.m
//  UWFNursing
//
//  Created by Janusz Chudzynski on 10/9/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCState.h"

@implementation ATCState

-(id)init{
    if(self = [super init])
    {
        //add KVO observers
        
    }
    return self;

}

-(BOOL)loggedIn{
    return self.nurse!=0;
}

@end
