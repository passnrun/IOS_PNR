//
//  News.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/24/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "News.h"

@implementation News

@synthesize nid;
@synthesize managerId;
@synthesize subject;
@synthesize date;
@synthesize content;

- (id)initWithDictionarty :(NSDictionary *)data
{
    if (self = [super init])
    {
        self.nid = [(NSString *)[data valueForKey:@"id"] intValue];
        self.managerId = [(NSString *)[data valueForKey:@"managerId"] intValue];
        self.subject = [data valueForKey:@"subject"] ;
        self.date = [data valueForKey:@"date"] ;
        self.content = [data valueForKey:@"body"] ;
    }
    return self;
}

@end
