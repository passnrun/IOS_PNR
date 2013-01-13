//
//  SQLLiteManager.m
//  PassNRun
//
//  Created by oral on 2/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SQLLiteManager.h"

@interface SQLLiteManager()
{
}
-(void)createDb;
-(BOOL)executeSql:(const char *)sql;
@end


@implementation SQLLiteManager
@synthesize pnrDB;

static SQLLiteManager *instance = nil;
#pragma mark Singleton Methods
+ (SQLLiteManager *)instance {
    if (instance == nil){
        instance = [[self alloc] init]; 
    }
    return instance;
}
- (id)init {
    if (self = [super init]) {
        [self createDb];
        NSLog(@"I - SQLLiteManager is created");
    }
    return self;
}

-(Current *)getLocalCurrent{
    Current * local = nil;
    sqlite3_stmt *statement;
    NSString * querySQL = @"SELECT MANAGER_ID, TEAM_ID, LEAGUE_ID, SEASON_ID, MAX_GAMES, MAX_NEWS, MAX_FINANCE FROM CURRENT";
    NSLog(@"D - getLocalCurrent SQL: \n%@", querySQL);
    const char *query_stmt = [querySQL UTF8String];
    if (sqlite3_prepare_v2(pnrDB, query_stmt, -1, &statement,NULL) == SQLITE_OK){
        if (sqlite3_step(statement) == SQLITE_ROW){
            local = [[Current alloc] init];
            local.managerId = sqlite3_column_int(statement, 0);
            local.teamId = sqlite3_column_int(statement, 1);
            local.leagueId = sqlite3_column_int(statement, 2);
            local.seasonId = sqlite3_column_int(statement, 3);
            local.maxGames = sqlite3_column_int(statement, 4);
            local.maxNews = sqlite3_column_int(statement, 5);
            local.maxFinance = sqlite3_column_int(statement, 6);
            NSLog(@"D - Local current is fetched successfully");
        }
        sqlite3_finalize(statement);
    }else
        NSLog(@"E - Local current query error ");
    return local;
}


-(void)createDb
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"passnrun.db"];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL success = [fileMgr fileExistsAtPath:appFile];
    if (!success) {
        NSLog(@"I - Database File is not in Documents folder, creating..");
        NSString * dbpath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"passnrun.db"];
        NSError * copyError = nil;
        [fileMgr copyItemAtPath:dbpath toPath:appFile error:&copyError];
        if (copyError != nil) {
            NSLog(@"E - Database File could not be copied :%@", [copyError description]);
        }
    }

    int res = sqlite3_open_v2([appFile UTF8String], &pnrDB, SQLITE_OPEN_READWRITE, NULL);
    if (res != SQLITE_OK)
        NSLog(@"E - Database Open Failed with reason:%i",res);
}

-(BOOL)insertNews:(News *)news{
	NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO NEWS (ID, MANAGER_ID, RECEIVE_DATE,SUBJECT) VALUES (%i, %i, '%@', '%@')", news.nid, news.managerId, news.date, news.subject];
    BOOL result = NO;
    NSLog(@"D - insertNews:\n%@",insertSQL);
    
    const char * insert_stmt = [insertSQL UTF8String];
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, insert_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        NSLog(@"I - insertNews is completed successfully");
        result = YES;
    }
    else{
        NSLog(@"E - insertNews is failed");
        result = NO;
    }
    sqlite3_finalize(statement);
    
	return result;
}

-(BOOL)insertManagerWith:(int)managerId And:(int)teamId{    
	NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CURRENT (MANAGER_ID, TEAM_ID, MAX_GAMES) VALUES (%i, %i, %i)", managerId, teamId, -1];
    BOOL result = NO;
    
    NSLog(@"D - insertManager:\n%@",insertSQL);
    
    const char * insert_stmt = [insertSQL UTF8String];
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, insert_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        NSLog(@"I - insertManager is completed successfully");
        result = YES;
    }
    else{
        NSLog(@"E - insertManager is failed");
        result = NO;
    }
    sqlite3_finalize(statement);
    
	return result;
}
-(BOOL)deleteManagerWith:(int)managerId
{
	NSString *deleteSQL = [NSString stringWithFormat: @"DELETE FROM CURRENT WHERE MANAGER_ID = %i", managerId];
    BOOL result = NO;
    
    NSLog(@"D - deleteManager:\n%@",deleteSQL);
    
    const char * delete_stmt = [deleteSQL UTF8String];
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, delete_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        NSLog(@"I - deleteManager is completed successfully");
        result = YES;
    }
    else{
        NSLog(@"E - deleteManager is failed");
        result = NO;
    }
    sqlite3_finalize(statement);
    
	return result;
}
-(BOOL)updateManagerWith:(int)leagueId And:(int)seasonId{    
	NSString *updateSQL = [NSString stringWithFormat: @"UPDATE CURRENT SET LEAGUE_ID = %i, SEASON_ID = %i", leagueId, seasonId];
    BOOL result = NO;
    
    NSLog(@"D - updateManagerWith:\n%@",updateSQL);
    
    const char * update_stmt = [updateSQL UTF8String];
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, update_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        NSLog(@"I - updateManagerWith is completed successfully");
        result = YES;
    }
    else{
        NSLog(@"E - updateManagerWith is failed");
        result = NO;
    }
    sqlite3_finalize(statement);
    return result;
}
-(BOOL)updateFixtureStatus{
	NSString *updateSQL = [NSString stringWithFormat: @"UPDATE CURRENT SET MAX_GAMES = 0"];
	const char * update_stmt = [updateSQL UTF8String];
    BOOL result = NO;
    NSLog(@"D - updateFixtureStatus:\n%@",updateSQL);
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, update_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        NSLog(@"I - updateFixtureStatus is completed successfully");
        result = YES;
    }
    else{
        NSLog(@"E - updateFixtureStatus is failed");
        result = NO;
    }
    sqlite3_finalize(statement);
	
	return result;
}

-(BOOL)clearTablesForNewSeason{
	return [self executeSql:@"DELETE FROM TEAM"]
    && [self executeSql:@"DELETE FROM LEAGUE_TABLE"]
    && [self executeSql:@"DELETE FROM FIXTURE"];
}

-(BOOL)insertTeam:(Team *)team{
	NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO TEAM (ID, NAME, COLOR1, COLOR2, CURRENT_LEAGUE, MANAGER, STADIUM) VALUES (%i, '%@', '%@', '%@', %i, '%@', '%@')"
						   , team.teamId, team.name, team.color1, team.color2, team.currentLeague, team.manager, team.stadium];
    
    NSLog(@"D - insertTeam:\n%@",insertSQL);
	
    const char * insert_stmt = [insertSQL UTF8String];
    BOOL result = NO;
    
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, insert_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        result = YES;
        NSLog(@"I - Team[%i] is inserted sucessfully",team.teamId);
    }		
    else{ 
        result = NO;
        NSLog(@"E - Team[%i] could not be inserted",team.teamId);
    }
    sqlite3_finalize(statement);
	return result;
}

-(BOOL)insertGame:(Game *)game{
	NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO FIXTURE (ID, TEAM1, TEAM2, SEASON_ID, WEEK, GAME_DATE) VALUES (%i, %i, %i, %i, %i, '%@')"
						   , game.gameId, game.team1, game.team2, game.season, game.week, game.date];
	const char * insert_stmt = [insertSQL UTF8String];
    BOOL result = NO;
    
    NSLog(@"D - insertGame:\n%@",insertSQL);
    
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, insert_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        result = YES;
        NSLog(@"I - Game[%i] is inserted sucessfully",game.gameId);
    }		
    else{ 
        result = NO;
        NSLog(@"E - Game[%i] could not be inserted",game.gameId);
    }
    sqlite3_finalize(statement);
	return result;
}

-(BOOL)updateGameResult:(GameResult *)gameResult{
	NSString *updateSQL = [NSString stringWithFormat: @"UPDATE FIXTURE SET SCORE1 = %i, SCORE2 = %i, ATTENDANCE = %i where ID = %i"
						   , gameResult.score1, gameResult.score2, gameResult.attendance, gameResult.gameId];
    BOOL result = NO;
	const char * update_stmt = [updateSQL UTF8String];
    NSLog(@"D - updateGameResult:\n%@",updateSQL);
    
    sqlite3_stmt * statement;
    sqlite3_prepare_v2(pnrDB, update_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE){
        result = YES;
        NSLog(@"I - GameResul[%i] is updated sucessfully",gameResult.gameId);
    }		
    else{ 
        result = NO;
        NSLog(@"E - GameResult[%i] could not be updated\n %s",gameResult.gameId, sqlite3_errmsg(pnrDB));
    }
    sqlite3_finalize(statement);
    return result;
}
- (NSArray *) getFixture{
    NSMutableArray * fixtureArray = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    
    NSString * querySQL = @"SELECT F.ID, F.TEAM1, T1.NAME, F.TEAM2, T2.NAME, F.WEEK, CASE WHEN (F.SCORE1 IS NULL) THEN 0 ELSE 1 END,F.GAME_DATE,F.SCORE1, F.SCORE2, F.ATTENDANCE FROM FIXTURE F, TEAM T1, TEAM T2 where F.TEAM1 = T1.ID and F.TEAM2 = T2.ID order by F.ID";
    NSLog(@"D - getFixture SQL: \n%@", querySQL);
    const char *query_stmt = [querySQL UTF8String];
    if (sqlite3_prepare_v2(pnrDB, query_stmt, -1, &statement,NULL) == SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW){
            Fixture * item = [[Fixture alloc] init];
            item.gameId = sqlite3_column_int(statement, 0);
            item.homeTeamId = sqlite3_column_int(statement, 1);
            item.homeTeamName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
            item.awayTeamId = sqlite3_column_int(statement, 3);
            item.awayTeamName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
            item.week = sqlite3_column_int(statement, 5);
            item.attendance = sqlite3_column_int(statement, 10);
            if (sqlite3_column_int(statement, 6) == 1)
                item.isPlayed = YES;
            else
                item.isPlayed = NO;
            
            item.date = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)];
            
            if(item.isPlayed){
                item.homeScore = sqlite3_column_int(statement, 8);
                item.awayScore = sqlite3_column_int(statement, 9);
            }
            [fixtureArray addObject:item];
        }
        sqlite3_finalize(statement);
    }else
        NSLog(@"E - getFixture Error");
    
    return fixtureArray;
}
- (NSArray *) getNews:(int)managerId
{
    NSMutableArray * tableArray = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    
    NSString * querySQL = [NSString stringWithFormat:@"SELECT ID, RECEIVE_DATE, SUBJECT from NEWS where MANAGER_ID = %i order by ID desc", managerId];
    NSLog(@"D - getNews SQL: \n%@", querySQL);
    const char *query_stmt = [querySQL UTF8String];
    if (sqlite3_prepare_v2(pnrDB, query_stmt, -1, &statement,NULL) == SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW){
            News * news = [[News alloc] init];
            news.nid      = sqlite3_column_int(statement, 0);
            news.date    = [NSString stringWithCString:sqlite3_column_text(statement, 1) encoding: NSUTF8StringEncoding];
            news.subject    = [NSString stringWithCString:sqlite3_column_text(statement, 2) encoding: NSUTF8StringEncoding];
            [tableArray addObject:news];
        }
        sqlite3_finalize(statement);
    }else
        NSLog(@"E - getNews Error");
    
    return tableArray;
}
- (NSArray *) getLeagueTable{
    NSMutableArray * tableArray = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    
    NSString * querySQL = @"SELECT LT.TEAM_ID, T.NAME, LT.PLAYED, LT.WON, LT.DRAW, LT.LOST, LT.FOR_GOAL, LT.AGAINST_GOAL, LT.POINTS FROM LEAGUE_TABLE LT, TEAM T where LT.TEAM_ID = T.ID order by LT.POINTS DESC, (LT.FOR_GOAL - LT.AGAINST_GOAL) desc, LT.AGAINST_GOAL";
    NSLog(@"D - getLeagueTable SQL: \n%@", querySQL);
    const char *query_stmt = [querySQL UTF8String];
    if (sqlite3_prepare_v2(pnrDB, query_stmt, -1, &statement,NULL) == SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW){
            LeagueTableRow * row = [[LeagueTableRow alloc] init];
            row.teamId      = sqlite3_column_int(statement, 0);
            row.teamName    = [NSString stringWithCString:sqlite3_column_text(statement, 1) encoding: NSUTF8StringEncoding];
            row.played      = sqlite3_column_int(statement, 2);
            row.won         = sqlite3_column_int(statement, 3);
            row.draw        = sqlite3_column_int(statement, 4);
            row.lost        = sqlite3_column_int(statement, 5);
            row.forGoals    = sqlite3_column_int(statement, 6);
            row.againstGoals= sqlite3_column_int(statement, 7);
            row.points      = sqlite3_column_int(statement, 8);
            [tableArray addObject:row];
        }
        sqlite3_finalize(statement);
    }else
        NSLog(@"E - getLeagueTable Error");
    
    NSArray * leagueTable = [NSArray arrayWithArray: tableArray];
    [tableArray release];
    return leagueTable;
}

- (NSString *)getTeamNameWithId:(int)teamId
{
    sqlite3_stmt *statement;
    NSString * teamName = @"";
    NSString * querySQL = [NSString stringWithFormat:@"SELECT T.NAME FROM TEAM T where T.ID = %i", teamId];
    NSLog(@"D - getTeamNameWithId SQL: \n%@", querySQL);
    const char *query_stmt = [querySQL UTF8String];
    if (sqlite3_prepare_v2(pnrDB, query_stmt, -1, &statement,NULL) == SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            teamName = [NSString stringWithCString:sqlite3_column_text(statement, 1) encoding: NSUTF8StringEncoding];
        }
        sqlite3_finalize(statement);
    }else
        NSLog(@"E - getTeamNameWithId Error");
    
    return teamName;

}

-(BOOL)executeSql:(NSString *)sql{
    char *errMsg;
    const char * sql_stmt = [sql UTF8String];
    NSLog(sql);
    if (sqlite3_exec(pnrDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
    {
        NSLog(@"E - executeSQL is failed for SQL :\n%@ \nError : %s ",sql, errMsg);
        return NO;        
    }
    
    return YES;  
}


@end
