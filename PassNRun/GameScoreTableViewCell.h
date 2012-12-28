//
//  GameScoreTableViewCell.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/8/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScoreTableViewCell : UITableViewCell
{
    IBOutlet UILabel * homePlayer;
    IBOutlet UILabel * awayPlayer;
    IBOutlet UILabel * minute;
    IBOutlet UIImageView * homeActionImage;
    IBOutlet UIImageView * awayActionImage;
}

@property (nonatomic, strong) UILabel * homePlayer;
@property (nonatomic, strong) UILabel * awayPlayer;
@property (nonatomic, strong) UILabel * minute;
@property (nonatomic, strong) UIImageView * homeActionImage;
@property (nonatomic, strong) UIImageView * awayActionImage;
@end
