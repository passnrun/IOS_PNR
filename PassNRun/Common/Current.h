//
//  Current.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/5/12.
//  Copyright 2012 PassN'Run. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Current : NSObject 
{
	int managerId;
	int teamId;
	int leagueId;
	int seasonId;
	int maxNews;
	int maxGames;
	int maxFinance;
}
@property (nonatomic) int managerId;
@property (nonatomic) int teamId;
@property (nonatomic) int leagueId;
@property (nonatomic) int seasonId;
@property (nonatomic) int maxNews;
@property (nonatomic) int maxGames;
@property (nonatomic) int maxFinance;

- (id) initWithDictionary:(NSDictionary *)data;
@end
