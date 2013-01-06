//
//  TeamPlayerPerformance.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/6/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamPlayerPerformance : NSObject
{
    NSArray * homeTeam;
    NSArray * awayTeam;
}
@property (nonatomic, retain) NSArray * homeTeam;
@property (nonatomic, retain) NSArray * awayTeam;
@end
