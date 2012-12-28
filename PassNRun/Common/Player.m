//
//  Player.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/25/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize pid, name, position, age, countryCode, latestForm, nativePosition, quality;

- (id)initWithDictionary:(NSDictionary *)player
{
    if (self = [super init])
    {
        self.age = [(NSString *)[player valueForKey:@"age"] intValue];
        self.pid = [(NSString *)[player valueForKey:@"playerId"] intValue];
        self.name = (NSString *)[player valueForKey:@"name"];
        self.position = (NSString *)[player valueForKey:@"position"];
        self.nativePosition = (NSString *)[player valueForKey:@"nativePosition"];
        self.latestForm = (NSString *)[player valueForKey:@"latestForm"];
        self.quality = (NSString *)[player valueForKey:@"quality"];
    }
    return self;
}

- (NSString *)toJSON
{
    NSString * json = [NSString stringWithFormat:@"{ pid : %i, position : \"%@\" }", pid, position];
    return json;
}
@end
