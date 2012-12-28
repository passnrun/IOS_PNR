//
//  GameResult.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/11/12.
//  Copyright 2012 passnrun. All rights reserved.
//

#import "GameResult.h"


@implementation GameResult

@synthesize gameId;
@synthesize score1;
@synthesize score2;
@synthesize attendance;

- (id)initWithDictionarty :(NSDictionary *)data
{
    if (self = [super init])
    {
        self.gameId = [(NSString *)[data valueForKey:@"id"] intValue];
        self.score1 = [(NSString *)[data valueForKey:@"score1"] intValue];
        self.score2 = [(NSString *)[data valueForKey:@"score2"] intValue];
        self.attendance = [(NSString *)[data valueForKey:@"attendance"] intValue];
    }
    return self;
}


@end
