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

@synthesize squad, substitutes,reserves, tid;

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
    
    for (int i = 0; i < [substitutes count]; i++)
    {
        Player * player = [substitutes objectAtIndex:i];
        squadJSON = [NSString stringWithFormat:@"%@ %@", squadJSON, [player toJSON]];
    }
    for (int i = 0; i < [reserves count]; i++)
    {
        Player * player = [reserves objectAtIndex:i];
        squadJSON = [NSString stringWithFormat:@"%@ %@", squadJSON, [player toJSON]];
    }
    NSString * json = [NSString stringWithFormat:@"{ id : %i, squad : [%@]}", tid, squadJSON];
    return json;
}
@end
