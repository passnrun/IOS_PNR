//
//  Tactic.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 10/15/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "Tactic.h"
#import "Player.h"

@implementation Tactic

@synthesize squad, substitutes, tid;

- (NSString *)toJSON
{
    NSString * squadJSON = @"";
    for (int i = 0; i < [squad count]; i++)
    {
        Player * player = [squad objectAtIndex:i];
        if (i > 0)
            squadJSON = [NSString stringWithFormat:@"%@ ,", squadJSON];
        squadJSON = [NSString stringWithFormat:@"%@ %@", squadJSON, [player toJSON]];
    }
    
    NSString * subsJSON = @"";
    for (int i = 0; i < [substitutes count]; i++)
    {
        Player * player = [substitutes objectAtIndex:i];
        if (i > 0)
            subsJSON = [NSString stringWithFormat:@"%@ ,", subsJSON];
        subsJSON = [NSString stringWithFormat:@"%@ %@", subsJSON, [player toJSON]];
    }
    NSString * json = [NSString stringWithFormat:@"{ id : %i, squad : [%@], substitutes : [%@]}", tid, squadJSON, subsJSON];
    return json;
}
@end
