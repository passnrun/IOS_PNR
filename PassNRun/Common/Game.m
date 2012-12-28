//
//  Game.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/11/12.
//  Copyright 2012 passnrun. All rights reserved.
//

#import "Game.h"


@implementation Game

@synthesize gameId;
@synthesize team1;
@synthesize team2;
@synthesize season;
@synthesize week;
@synthesize date;

- (id)initWithDictionary : (NSDictionary *) data
{
    if (self = [super init])
    {
        self.gameId = [(NSString *)[data valueForKey:@"id"] intValue];
        self.team1 = [(NSString *)[data valueForKey:@"team1"] intValue];
        self.team2 = [(NSString *)[data valueForKey:@"team2"] intValue];
        self.season = [(NSString *)[data valueForKey:@"season"] intValue];
        self.week = [(NSString *)[data valueForKey:@"week"] intValue];
        self.date = [data valueForKey:@"date"];
    }
    return self;
}

@end
