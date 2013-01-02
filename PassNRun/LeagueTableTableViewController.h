//
//  LeagueTableTableViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/4/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeagueTableTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray * leagueTableArray;
    IBOutlet UITableView * leagueTableView;
    UIImageView *imageCell;
    BOOL isLeagueDrawn;
}
@property(nonatomic,retain) UIImageView *imageCell;
@property(nonatomic,retain) NSArray * leagueTableArray;
@property(nonatomic,retain) UITableView * leagueTableView;
@property(nonatomic,assign) BOOL isLeagueDrawn;


-(IBAction)backView:(id)sender;

@end
