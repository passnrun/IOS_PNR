//
//  Tactic.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 10/15/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tactic : NSObject
{
    int tid;
    NSArray * squad;
    NSArray * substitutes;
    NSArray * reserves;
}

- (NSString *) toJSON;

@property(nonatomic,assign) int tid;
@property(nonatomic,strong) NSArray * squad;
@property(nonatomic,strong) NSArray * substitutes;
@property(nonatomic,strong) NSArray * reserves;

@end
