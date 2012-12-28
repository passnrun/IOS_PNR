//
//  Game.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/11/12.
//  Copyright 2012 passnrun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Game : NSObject {
	int gameId;
	int team1;
	int team2;
	int season;
	int week;
	NSString * date;
}

@property (nonatomic, assign) int gameId;
@property (nonatomic, assign) int team1;
@property (nonatomic, assign) int team2;
@property (nonatomic, assign) int season;
@property (nonatomic, assign) int week;
@property (nonatomic, assign) NSString * date;

- (id)initWithDictionary : (NSDictionary *) data;

@end
