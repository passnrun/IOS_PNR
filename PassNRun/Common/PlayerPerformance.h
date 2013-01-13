//
//  PlayerPerformance.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/6/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerPerformance : NSObject
{
    int pid;
	NSString * name;
	NSString * position;
	NSString * form;
	int mins;
	int assist;
	int goal;
	int morale;
}
@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSString * form;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int mins;
@property (nonatomic) int assist;
@property (nonatomic) int goal;
@property (nonatomic) int morale;
@property (nonatomic) int pid;

- (id) initWithDictionary:(NSDictionary *)data;
@end
