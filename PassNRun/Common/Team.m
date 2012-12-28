//
//  Team.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/11/12.
//  Copyright 2012 passnrun. All rights reserved.
//

#import "Team.h"


@implementation Team

@synthesize teamId;
@synthesize name;
@synthesize color1;
@synthesize color2;
@synthesize currentLeague;
@synthesize manager;
@synthesize stadium;

- (id)initWithDictionary:(NSDictionary *)data
{
    if (self = [super init])
    {
        self.teamId = [(NSString *)[data valueForKey:@"id"] intValue];
        self.name = [data valueForKey:@"name"];
        self.color1 = [data valueForKey:@"color1"];
        self.color2 = [data valueForKey:@"color2"];
        self.currentLeague = [(NSString *)[data valueForKey:@"currentLeague"] intValue];
        self.manager = [data valueForKey:@"manager"];
        self.stadium = [data valueForKey:@"stadium"];
    }
    return self;
    
}
@end
