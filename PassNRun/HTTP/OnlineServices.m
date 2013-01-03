//
//  OnlineServices.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/5/12.
//  Copyright 2012 PassN'Run. All rights reserved.
//

#import "OnlineServices.h"
#import "Current.h"
#import "Team.h"
#import "GameResult.h"
#import "GameScoreItem.h"
#import "Game.h"
#import "Response.h"
#import "JSONParser.h"
#import "Player.h"

@interface OnlineServices(){
}

+(NSString *)postRequest:(NSString *)input;

@end


@implementation OnlineServices

+(Response *)sync:(int)managerId
{
	NSString *input = [NSString stringWithFormat:@"{\"service\" : \"sync\", \"managerId\" : %i}", managerId];
	NSString * response = [self postRequest:input];
	NSDictionary * directory = [JSONParser parse:response];
	Current * curObj = nil;
    Response * resp = [[Response alloc] init];
 	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSDictionary * data = (NSDictionary *)[directory valueForKey:@"data"];
		curObj = [[Current alloc]initWithDictionary:data];
        resp.isSuccessful= YES;
        resp.object = curObj;
        NSLog(@"sync is successful");
	}else {
		NSLog(@"Error in Sync Response:%@", [directory valueForKey:@"data"]);
        resp.isSuccessful = NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}	
	return resp;
}

+(Response *)registr:(NSString *)firstName : (NSString *) lastName : (NSString *) team : (NSString *) nationality : (NSString *) lang : (NSString *) birthdate : (NSString *) deviceId
{
	NSString * input = [NSString stringWithFormat:@"{\"service\" : \"register\",\"manager\" : {\"firstName\" : \"%@\",\"lastName\" : \"%@\",\"team\" : \"%@\", \"nationality\" : \"%@\",\"language\" : \"%@\",\"birthdate\" : \"%@\",\"device\" : \"%@\",\"deviceId\" : \"%@\"}}",firstName , lastName , team,  nationality , lang , birthdate , @"IPhone" , deviceId];
	NSString * output = [OnlineServices postRequest:input];
	NSDictionary * directory = [JSONParser parse:output];
	Current * curObj = [[Current alloc] init];
    Response * resp = [[Response alloc] init];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSDictionary * data = (NSDictionary *)[directory valueForKey:@"data"];
		curObj.managerId = [(NSString *)[data valueForKey:@"managerId"] intValue];
		curObj.teamId = [(NSString *)[data valueForKey:@"teamId"] intValue];
		NSLog(@"Register is successful..");
        resp.isSuccessful= YES;
        resp.object = curObj;
	}else {
		NSLog(@"Error in Register Response:%@", [directory valueForKey:@"data"]);
        resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}	
	return resp;
}
+(Response *)getSquad:(int)teamId
{
    NSString * input = [NSString stringWithFormat:@"{\"teamId\" : %i,\"service\" : \"squad\"}", teamId];
	NSString * output = [OnlineServices postRequest:input];
	NSDictionary * directory = [JSONParser parse:output];
    Response * resp = [[Response alloc] init];
    Tactic * teamTactic = [[Tactic alloc] init];
    NSMutableArray * firstTeamPlayes = [NSMutableArray arrayWithCapacity:11];
    NSMutableArray * subsPlayes = [NSMutableArray arrayWithCapacity:7];
    NSMutableArray * reservePlayes = [NSMutableArray arrayWithCapacity:6];
    if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSDictionary * tactic = (NSDictionary *)[directory valueForKey:@"data"];
		int tacticId = [(NSString *)[tactic valueForKey:@"id"] intValue];
        NSArray * squad = (NSArray *) [tactic objectForKey:@"firstTeam"];
        NSArray * substitutes = (NSArray *) [tactic objectForKey:@"subs"];
        NSArray * reserves = (NSArray *) [tactic objectForKey:@"reserves"];
        for (NSDictionary * player in squad)
        {
            Player * p = [[Player alloc] initWithDictionary:player];
            [firstTeamPlayes addObject:p];
        }
        for (NSDictionary * player in substitutes)
        {
            Player * p = [[Player alloc] initWithDictionary:player];
            [subsPlayes addObject:p];
        }
        for (NSDictionary * player in reserves)
        {
            Player * p = [[Player alloc] initWithDictionary:player];
            [reservePlayes addObject:p];
        }
        teamTactic.tid = tacticId;
        teamTactic.substitutes = subsPlayes;
        teamTactic.squad = firstTeamPlayes;
        teamTactic.reserves = reservePlayes;
		NSLog(@"getGetSquad is successful..");
        resp.isSuccessful= YES;
		resp.object = teamTactic;
	}else {
		NSLog(@"Error in getGetSquad Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}
    return resp;
}
+(Response *)saveSquad:(Tactic *)tactic
{
    NSString * input = [NSString stringWithFormat:@"{\"tactic\" : %@,\"service\" : \"saveSquad\"}", [tactic toJSON]];
	NSString * output = [OnlineServices postRequest:input];
	NSDictionary * directory = [JSONParser parse:output];
    Response * resp = [[Response alloc] init];
    if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSLog(@"saveSquad is successful..");
        resp.isSuccessful= YES;
		resp.object = tactic;
	}else {
		NSLog(@"Error in saveSquad Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}
    return resp;
}

+(Response *)getTeamList:(int)leagueId
{
	NSString * input = [NSString stringWithFormat:@"{\"leagueId\" : %i,\"service\" : \"teamList\"}", leagueId];
	NSString * output = [OnlineServices postRequest:input];
	NSDictionary * directory = [JSONParser parse:output];
    Response * resp = [[Response alloc] init];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSArray * teams = (NSArray *)[directory valueForKey:@"data"];
		NSMutableArray * outputList = [NSMutableArray arrayWithCapacity:8];
		for (NSDictionary * data in teams) 
		{
			Team * t = [[Team alloc] initWithDictionary:data];
			[outputList addObject:t];
		}
		NSLog(@"getTeamList is successful..");
        resp.isSuccessful= YES;
		resp.object = outputList;
	}else {
		NSLog(@"Error in getTeamList Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}	
    return resp;
}

+(Response *)getFixture:(int)seasonId : (int) leagueId
{
	NSString * input = [NSString stringWithFormat:@"{\"leagueId\" : %i, \"seasonId\" : %i, \"service\" : \"fixture\"}", leagueId, seasonId];
	NSString * output = [OnlineServices postRequest:input];
	NSDictionary * directory = [JSONParser parse:output];
    Response * resp = [[Response alloc] init];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSArray * teams = (NSArray *)[directory valueForKey:@"data"];
		NSMutableArray * outputList = [NSMutableArray arrayWithCapacity:8];
		for (NSDictionary * data in teams) 
		{
			Game * game = [[Game alloc] initWithDictionary:data];
			[outputList addObject:game];
		}
		NSLog(@"getFixture is successful..");
		resp.isSuccessful= YES;
		resp.object = outputList;
	}else {
		NSLog(@"Error in getFixture Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}
    return resp;
}
+(Response *)getGameDetailList:(int)gameId : (int) logLevel
{
    NSString * input = [NSString stringWithFormat:@"{\"gameId\" : %i, \"logLevel\" : %i, \"service\" : \"gameDetails\"}", gameId, logLevel];
	NSString * output = [OnlineServices postRequest:input];
    Response * resp = [[Response alloc] init];
	NSDictionary * directory = [JSONParser parse:output];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSArray * grList = (NSArray *)[directory valueForKey:@"data"];
		NSMutableArray * outputList = [NSMutableArray arrayWithCapacity:8];
		for (NSDictionary * data in grList)
		{
			GameScoreItem * gr = [[GameScoreItem alloc] initWithDictionarty:data];
            [outputList addObject:gr];
		}
		NSLog(@"getGameDetailList is successful[%i]..", [outputList count]);
        resp.isSuccessful= YES;
		resp.object = outputList;
		
	}else {
		NSLog(@"Error in getGameDetailList Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}
    return resp;

}

+(Response *)resign:(int)managerId
{
	NSString * input = [NSString stringWithFormat:@"{\"service\" : \"resign\", \"id\" : %i}", managerId];
	NSString * output = [OnlineServices postRequest:input];
    Response * resp = [[Response alloc] init];
	NSDictionary * directory = [JSONParser parse:output];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
        NSLog(@"resign is successful..");
        resp.isSuccessful= YES;
	}else {
		NSLog(@"Error in Resign Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}
    return resp;
}

+(Response *)getGameResultList:(int)minId : (int) managerId
{
	NSString * input = [NSString stringWithFormat:@"{\"minId\" : %i, \"managerId\" : %i, \"service\" : \"gameResult\"}", minId, managerId];
	NSString * output = [OnlineServices postRequest:input];
    Response * resp = [[Response alloc] init];
	NSDictionary * directory = [JSONParser parse:output];
	if ([[directory valueForKey:@"result"] isEqualToString:@"0"]){
		NSArray * grList = (NSArray *)[directory valueForKey:@"data"];
		NSMutableArray * outputList = [NSMutableArray arrayWithCapacity:8];
		for (NSDictionary * data in grList)
		{
			GameResult * gr = [[GameResult alloc] initWithDictionarty:data];
            [outputList addObject:gr];
		}
		NSLog(@"getGameResultList is successful..");
        resp.isSuccessful= YES;
		resp.object = outputList;
		
	}else {
		NSLog(@"Error in getGameResultList Response:%@", [directory valueForKey:@"data"]);
		resp.isSuccessful= NO;
        resp.errorMessage = [directory valueForKey:@"data"];
	}	
    return resp;
}


+(NSString *)postRequest:(NSString *)input{
	//NSString *urlString = @"http://pickledphotos.com/passnrun/Mobile";
    NSString *urlString = @"http://localhost:8080/PassNRun_v1/Mobile";
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	//set headers
	NSString *contentType = @"application/x-www-form-urlencoded";
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
	
	//create the body
	NSData * postData = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	//[postBody appendData:postData];
	NSLog(@"Request :\n%@\n", input);
	//post
	[request setHTTPBody:postData];
	
	//get response
	NSHTTPURLResponse *urlResponse = nil; 
	NSError *error = [[NSError alloc] init];
	NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
	NSString *result = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
	if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
		NSLog(@"Response :\n%@\n", result);
		return result;
	}else {
		return [NSString stringWithFormat:@"Error in postRequest: Http Status Code : %i", urlResponse.statusCode];
	}
}

@end

