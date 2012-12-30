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
    IBOutlet UILabel * age;
    IBOutlet UILabel * quality;
    IBOutlet UIImageView * positionMatchImage;
}

@property (nonatomic, strong) UILabel * playerName;
@property (nonatomic, strong) UILabel * latestForm;
@property (nonatomic, strong) UILabel * position;
@property (nonatomic, strong) UILabel * age;
@property (nonatomic, strong) UILabel * quality;
@property (nonatomic, strong) UIImageView * positionMatchImage;
@end
