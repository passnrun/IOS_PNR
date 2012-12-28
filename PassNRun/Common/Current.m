//
//  Current.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Current.h"


@implementation Current
	@synthesize managerId;
	@synthesize teamId;
	@synthesize leagueId;
	@synthesize seasonId;
	@synthesize maxNews;
	@synthesize maxGames;
	@synthesize maxFinance;

- (id)initWithDictionary:(NSDictionary *)data
{
    if (self = [super init])
    {
        self.managerId = [(NSString *)[data valueForKey:@"managerId"] intValue];
		self.teamId = [(NSString *)[data valueForKey:@"teamId"] intValue];
		self.maxNews = [(NSString *)[data valueForKey:@"maxNews"] intValue];
		self.maxFinance = [(NSString *)[data valueForKey:@"maxFinance"] intValue];
		self.maxGames = [(NSString *)[data valueForKey:@"maxGames"] intValue];
		self.seasonId = [(NSString *)[data valueForKey:@"seasonId"] intValue];
		self.leagueId = [(NSString *)[data valueForKey:@"leagueId"] intValue];
    }
    return self;
}
@end
