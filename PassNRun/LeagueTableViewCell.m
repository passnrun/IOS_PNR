//
//  LeagueTableViewCell.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/4/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "LeagueTableViewCell.h"

@implementation LeagueTableViewCell

@synthesize rank,avgGoals, points, win, lost, draw, forGoals, againstGoals, team, played;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
