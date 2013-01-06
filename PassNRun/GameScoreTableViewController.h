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
#import "Common/TeamPlayerPerformance.h"

@interface GameScoreTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource,UIScrollViewDelegate>
{
    IBOutlet UILabel * homeTeam;
    IBOutlet UILabel * awayTeam;
    IBOutlet UILabel * score;
    IBOutlet UILabel * subTitle;
    IBOutlet UILabel * attendance;
    IBOutlet UITableView * gameActionsTableView;
    IBOutlet UITableView * homeTeamStatsTableView;
    IBOutlet UITableView * awayTeamStatsTableView;
    IBOutlet UIWebView * gameDetailWebView;
    IBOutlet UIScrollView * mainScroll;
    IBOutlet UIPageControl * pageControl;
    GameScore * gameScore;
    TeamPlayerPerformance * teamPlayersPerformance;
    Fixture * fixture;
}
-(IBAction)backView:(id)sender;

@property (nonatomic, strong) UILabel * homeTeam;
@property (nonatomic, strong) UILabel * awayTeam;
@property (nonatomic, strong) UILabel * score;
@property (nonatomic, strong) UILabel * subTitle;
@property (nonatomic, strong) UILabel * attendance;
@property (nonatomic, strong) GameScore * gameScore;
@property (nonatomic, strong) Fixture * fixture;
@property (nonatomic, strong) TeamPlayerPerformance * teamPlayersPerformance;
@property (nonatomic, strong) UITableView * gameActionsTableView;
@property (nonatomic, strong) UITableView * homeTeamStatsTableView;
@property (nonatomic, strong) UITableView * awayTeamStatsTableView;
@property (nonatomic, strong) UIWebView * gameDetailWebView;
@property (nonatomic, strong) UIScrollView * mainScroll;
@property (nonatomic, strong) UIPageControl * pageControl;
@end
