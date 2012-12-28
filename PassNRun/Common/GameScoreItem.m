//
//  GameScoreItem.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/8/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "GameScoreItem.h"

@implementation GameScoreItem
@synthesize player, minute, team, action;

- (id)initWithDictionarty:(NSDictionary *)data
{
    if (self = [super init])
    {
        self.player = (NSString *)[data valueForKey:@"player"];
        self.minute = [(NSString *)[data valueForKey:@"minute"] intValue];
        self.team = [(NSString *)[data valueForKey:@"team"] intValue];
        self.action = [(NSString *)[data valueForKey:@"action"] intValue];
    }
    return self;
}

- (UIImage *) actionImage{
    switch (action) {
        case GOAL:
            return [UIImage imageNamed:@"goal.png"];
        case YELLOW:
            return [UIImage imageNamed:@"yellow.png"];
        case RED:
            return [UIImage imageNamed:@"red.png"];
        case IN:
            return [UIImage imageNamed:@"in.png"];
        case OUT:
            return [UIImage imageNamed:@"out.png"];
    }
    return [UIImage imageNamed:@""];
}
@end
