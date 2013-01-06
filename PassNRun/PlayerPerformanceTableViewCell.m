//
//  PlayerPerformanceTableViewCell.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/5/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import "PlayerPerformanceTableViewCell.h"

@implementation PlayerPerformanceTableViewCell
@synthesize position, name,goal,assist,morale,form;
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

- (void)setPlayerPerformance:(PlayerPerformance *)pp
{
    name.text = pp.name;
    position.text = pp.position;
    form.text = pp.form;
    assist.text = [NSString stringWithFormat:@"%i", pp.assist];
    goal.text = [NSString stringWithFormat:@"%i", pp.goal];
    morale.text = [NSString stringWithFormat:@"%i", pp.morale];
}

@end
