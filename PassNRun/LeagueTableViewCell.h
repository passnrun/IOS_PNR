//
//  LeagueTableViewCell.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/4/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeagueTableViewCell : UITableViewCell
{
    IBOutlet   UILabel *rank;
    IBOutlet   UILabel *team;
    IBOutlet   UILabel *played;
    IBOutlet   UILabel *win;
    IBOutlet   UILabel *lost;
    IBOutlet   UILabel *draw;
    IBOutlet   UILabel *forGoals;
    IBOutlet   UILabel *againstGoals;
    IBOutlet   UILabel *avgGoals;
    IBOutlet   UILabel *points;
    
}
@property(nonatomic,strong) UILabel *rank;
@property(nonatomic,strong) UILabel *team;
@property(nonatomic,strong) UILabel *played;
@property(nonatomic,strong) UILabel *win;
@property(nonatomic,strong) UILabel *lost;
@property(nonatomic,strong) UILabel *draw;
@property(nonatomic,strong) UILabel *forGoals;
@property(nonatomic,strong) UILabel *againstGoals;
@property(nonatomic,strong) UILabel *avgGoals;
@property(nonatomic,strong) UILabel *points;
@end
