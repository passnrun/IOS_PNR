//
//  Position.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 12/30/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "Position.h"

@implementation Position
@synthesize side, position;


//Positions
NSString *const GOALKEEPER              = @"GK";
NSString *const DEFENDER 				= @"D";
NSString *const MIDFIELDER 				= @"M";
NSString *const DEFENSIVE_MIDFIELDER 	= @"DM";
NSString *const ATTACKING_MIDFIELDER 	= @"AM";
NSString *const STRIKER 				= @"ST";

NSString *const SUBSTITITE 				= @"S";

//Sides
NSString *const LEFT			= @"L";
NSString *const RIGHT           = @"R";
NSString *const CENTER          = @"C";

- (id)initWithCode:(NSString *)code
{
    if (self = [super init])
    {
        NSArray * parts = [code componentsSeparatedByString: @"("];
        self.position = [parts objectAtIndex:0];
		if ([parts count] == 1){
			side = CENTER;
		}else{
			side = [parts[1] stringByReplacingOccurrencesOfString:@")" withString:@""];
		}
    }
    return self;
}
- (int) positionIndex
{
    NSArray * positions = @[GOALKEEPER, DEFENDER, DEFENSIVE_MIDFIELDER, MIDFIELDER, ATTACKING_MIDFIELDER, STRIKER];
    for (int i = 0; i < [positions count]; i++) {
        if ([self.position isEqualToString:(NSString *)[positions objectAtIndex:i]])
            return i;
    }
    //NSLog(@"PositionIndex could not match position:%@", self.position);
    return -1;
}
- (int) match:(Position *) p
{
    if ([p positionIndex] == -1  || [self positionIndex] == -1)
        return 0;
    
    if ([p.position isEqualToString:self.position]){
        //If both side and pos matches, return 0
        if ([p.side isEqualToString:self.side])
            return 0;
        //If only side is different, return 1
        else
            return 1;
    }
    // We know here that positions do not match
    if ([p.side isEqualToString: self.side]){
        //GKs cannot play anywhere else
        if ([p.position isEqualToString: GOALKEEPER] || [self.position isEqualToString: GOALKEEPER])
            return 2;
        //couldnt find abs for objective C..
        if ([p positionIndex] - [self positionIndex] == -1
            || [p positionIndex] - [self positionIndex] == 1)
            return 1;
        return 2;
    }
    return 2;
}

@end
