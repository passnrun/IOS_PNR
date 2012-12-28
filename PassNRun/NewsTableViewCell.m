//
//  NewsTableViewCell.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/24/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

@synthesize date, subject;

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
