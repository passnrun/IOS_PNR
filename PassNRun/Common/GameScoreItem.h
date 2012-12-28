//
//  GameScoreItem.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/8/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    GOAL = 1,
    YELLOW = 2,
    RED = 3,
    IN = 4,
    OUT =5
};

@interface GameScoreItem : NSObject
{
    NSString * player;
    int minute;
    int team;
    int action;
}

@property (nonatomic, strong) NSString * player;
@property (nonatomic, assign) int minute;
@property (nonatomic, assign) int team;
@property (nonatomic, assign) int action;

- (id)initWithDictionarty :(NSDictionary *)data;
- (UIImage *) actionImage;
@end
