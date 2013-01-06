//
//  Fixture.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 8/26/12.
//
//

#import <Foundation/Foundation.h>

@interface Fixture : NSObject{
    int gameId;
    NSString * homeTeamName;
    int homeTeamId;
    NSString * awayTeamName;
    int awayTeamId;
    int homeScore;
    int awayScore;
    int week;
    int attendance;
    NSString * date;
    BOOL isPlayed;
}

@property (assign) int gameId;
@property (nonatomic, retain) NSString * homeTeamName;
@property (assign) int homeTeamId;
@property (nonatomic, retain) NSString * awayTeamName;
@property (assign) int awayTeamId;
@property (assign) int homeScore;
@property (assign) int awayScore;
@property (assign) int week;
@property (assign) int attendance;
@property (nonatomic, retain) NSString * date;
@property (assign) BOOL isPlayed;
@end
