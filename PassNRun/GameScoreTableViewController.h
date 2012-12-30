//
//  GameScoreTableViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/8/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common/GameScore.h"
#import "Common/Fixture.h"

@interface GameScoreTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UILabel * homeTeam;
    IBOutlet UILabel * awayTeam;
    IBOutlet UILabel * score;
    IBOutlet UITableView * gameActionsTableView;
    GameScore * gameScore;
    Fixture * fixture;
}
-(IBAction)backView:(id)sender;

@property (nonatomic, strong) UILabel * homeTeam;
@property (nonatomic, strong) UILabel * awayTeam;
@property (nonatomic, strong) UILabel * score;
@property (nonatomic, strong) GameScore * gameScore;
@property (nonatomic, strong) Fixture * fixture;
@property (nonatomic, strong) UITableView * gameActionsTableView;
@end
