//
//  FixtureTableViewCell.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/3/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FixtureTableViewCell : UITableViewCell
{
    IBOutlet   UILabel *homeTeam;
    IBOutlet   UILabel *awayTeam;
    IBOutlet   UILabel *date;
    IBOutlet   UILabel *score;
    IBOutlet   UIButton * scoreButton;
}

@property(nonatomic,strong)UILabel *homeTeam;
@property(nonatomic,strong)UILabel *awayTeam;
@property(nonatomic,strong)UILabel *date;
@property(nonatomic,strong)UILabel *score;
@property(nonatomic,strong)UIButton * scoreButton;

@end
