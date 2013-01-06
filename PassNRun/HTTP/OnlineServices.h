//
//  OnlineServices.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Current.h"
#import "Response.h"
#import "Tactic.h"


@interface OnlineServices : NSObject {
}

+(Response *)sync:(int)managerId;
+(Response *)registr:(NSString *)firstName : (NSString *) lastName : (NSString *) nationality : (NSString *) lang : (NSString *)birthdate : (NSString *) deviceId;
+(Response *)resign:(int)managerId;
+(Response *)getTeamList:(int)leagueId;
+(Response *)getFixture:(int)seasonId : (int) leagueId;
+(Response *)getGameResultList:(int)minId : (int) managerId;
+(Response *)getGameDetailList:(int)gameId : (int) logLevel;
+(Response *)getGameTeamStats:(int)gameId;
+(Response *)getSquad:(int)teamId;
+(Response *)saveSquad:(Tactic *)tactic;


@end
