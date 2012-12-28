//
//  Player.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/25/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
{
    int pid;
    NSString * name;
    NSString * position;
    NSString * nativePosition;
    NSString * latestForm;
    NSString * quality;
    int age;
    NSString * countryCode;
}
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * position;
@property (nonatomic, strong) NSString * nativePosition;
@property (nonatomic, strong) NSString * latestForm;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int pid;
@property (nonatomic, strong) NSString * countryCode;
@property (nonatomic, strong) NSString * quality;

- (id) initWithDictionary :(NSDictionary *)player;
- (NSString *)toJSON;

@end
