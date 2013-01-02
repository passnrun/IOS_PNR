//
//  FixtureTableViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/3/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FixtureTableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
   
    NSArray * fixtureArray;
    NSDateFormatter *dateFormatter;
    IBOutlet UITableView * fixtureTable;
    BOOL isFixtureDrawn;
}

@property(nonatomic,strong) NSArray * fixtureArray;
@property(nonatomic,strong) NSDateFormatter * dateFormatter;
@property(nonatomic,strong) UITableView * fixtureTable;
@property(nonatomic,assign) BOOL isFixtureDrawn;

-(IBAction)backView:(id)sender;

@end
