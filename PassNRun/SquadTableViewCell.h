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
    IBOutlet UILabel * playerNativePosition;
    IBOutlet UILabel * latestForm;
    IBOutlet UILabel * playerAge;
    IBOutlet UILabel * position;
}

@property (nonatomic, strong) UILabel * playerName;
@property (nonatomic, strong) UILabel * playerNativePosition;
@property (nonatomic, strong) UILabel * latestForm;
@property (nonatomic, strong) UILabel * playerAge;
@property (nonatomic, strong) UILabel * position;
@end
