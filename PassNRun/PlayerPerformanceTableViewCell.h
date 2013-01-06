//
//  PlayerPerformanceTableViewCell.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/5/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerPerformance.h"

@interface PlayerPerformanceTableViewCell : UITableViewCell
{
    IBOutlet UILabel * position;
    IBOutlet UILabel * name;
    IBOutlet UILabel * goal;
    IBOutlet UILabel * assist;
    IBOutlet UILabel * morale;
    IBOutlet UILabel * form;
    
}

@property (nonatomic, strong) UILabel * position;
@property (nonatomic, strong) UILabel * name;
@property (nonatomic, strong) UILabel * goal;
@property (nonatomic, strong) UILabel * assist;
@property (nonatomic, strong) UILabel * morale;
@property (nonatomic, strong) UILabel * form;

- (void)setPlayerPerformance :(PlayerPerformance *)pp;
@end
