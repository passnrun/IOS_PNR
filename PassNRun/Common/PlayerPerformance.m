//
//  PlayerPerformance.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/6/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import "PlayerPerformance.h"

@implementation PlayerPerformance
@synthesize name,position,form,assist,goal,mins,morale;

- (id)initWithDictionary:(NSDictionary *)data
{
    if (self = [super init])
    {
        self.name = [data valueForKey:@"name"];
        self.position = [data valueForKey:@"position"];
        self.form = [data valueForKey:@"form"];
        self.goal = [(NSString *)[data valueForKey:@"goal"] intValue];
        self.assist = [(NSString *)[data valueForKey:@"assist"] intValue];
        self.mins= [(NSString *)[data valueForKey:@"mins"] intValue];
        self.morale = [(NSString *)[data valueForKey:@"morale"] intValue];
    }
    return self;
    
}
@end
