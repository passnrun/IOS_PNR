//
//  SQLLiteManager.h
//  PassNRun
//
//  Created by oral on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Current.h"
#import "Team.h"
#import "Game.h"
#import "GameResult.h"
#import "Fixture.h"
#import "LeagueTableRow.h"


@interface SQLLiteManager : NSObject{
    sqlite3 * pnrDB;
}

@property(nonatomic, assign) sqlite3 * pnrDB;

+ (id)instance;
- (Current *)getLocalCurrent;
- (BOOL)clearTablesForNewSeason;
- (BOOL)insertManagerWith:(int)managerId And:(int)teamId;
- (BOOL)updateManagerWith:(int)leagueId And:(int)seasonId;
- (BOOL)updateFixtureStatus;
- (BOOL)deleteManagerWith:(int)managerId;
- (BOOL)insertTeam:(Team *)team;
- (BOOL)insertGame:(Game *)game;
- (BOOL)updateGameResult:(GameResult *)gameResult;
- (NSArray *) getFixture;
- (NSArray *) getLeagueTable;
- (NSString *) getTeamNameWithId:(int)teamId;

@end
