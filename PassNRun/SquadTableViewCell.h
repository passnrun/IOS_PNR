//
//  SquadTableViewCell.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/25/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquadTableViewCell : UITableViewCell
{
    IBOutlet UILabel * playerName;
    IBOutlet UILabel * latestForm;
    IBOutlet UILabel * position;
    IBOutlet UILabel * fitness;
    IBOutlet UILabel * morale;
    IBOutlet UIImageView * positionMatchImage;
}

@property (nonatomic, strong) UILabel * playerName;
@property (nonatomic, strong) UILabel * latestForm;
@property (nonatomic, strong) UILabel * position;
@property (nonatomic, strong) UILabel * fitness;
@property (nonatomic, strong) UILabel * morale;
@property (nonatomic, strong) UIImageView * positionMatchImage;
@end
