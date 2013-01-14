//
//  PlayerDetailViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/9/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNRBaseViewController.h"

@interface PlayerDetailViewController : PNRBaseViewController<UIPickerViewDelegate, UIPickerViewDataSource,UIScrollViewDelegate>
{
    IBOutlet UILabel * playerName;
    IBOutlet UILabel * age;
    IBOutlet UILabel * position;
    IBOutlet UILabel * team;
    IBOutlet UILabel * birthdate;
    IBOutlet UILabel * nationality;
    IBOutlet UILabel * condition;
    IBOutlet UILabel * morale;
    IBOutlet UILabel * injury;
    IBOutlet UILabel * bans;
    IBOutlet UILabel * assist;
    IBOutlet UILabel * avgRating;
    IBOutlet UILabel * appearence;
    IBOutlet UILabel * latestForm;
    IBOutlet UILabel * goals;
    
    IBOutlet UILabel * handling;
	IBOutlet UILabel * reflexes;
	IBOutlet UILabel * tackling;
	IBOutlet UILabel * heading;
	IBOutlet UILabel * passing;
	IBOutlet UILabel * creativity;
	IBOutlet UILabel * crossing;
	IBOutlet UILabel * technique;
	IBOutlet UILabel * positioning;
	IBOutlet UILabel * shooting;
	IBOutlet UILabel * dribbling;
	IBOutlet UILabel * finishing;
	IBOutlet UILabel * firstTouch;
	IBOutlet UILabel * composure;
	IBOutlet UILabel * agility;
	IBOutlet UILabel * teamwork;
	IBOutlet UILabel * acceleration;
	IBOutlet UILabel * stamina;
	IBOutlet UILabel * strength;
    
    
    IBOutlet UIScrollView * mainScroll;
    IBOutlet UIPageControl * pageControl;
    NSDictionary * player;
    int playerId;
}

@property (nonatomic, strong) UILabel * playerName;
@property (nonatomic, strong) UILabel * age;
@property (nonatomic, strong) UILabel * position;
@property (nonatomic, strong) UILabel * team;
@property (nonatomic, strong) UILabel * birthdate;
@property (nonatomic, strong) UILabel * nationality;
@property (nonatomic, strong) UILabel * condition;
@property (nonatomic, strong) UILabel * morale;
@property (nonatomic, strong) UILabel * injury;
@property (nonatomic, strong) UILabel * bans;
@property (nonatomic, strong) UILabel * assist;
@property (nonatomic, strong) UILabel * avgRating;
@property (nonatomic, strong) UILabel * appearence;
@property (nonatomic, strong) UILabel * latestForm;
@property (nonatomic, strong) UILabel * goals;

@property (nonatomic, strong) UILabel * handling;
@property (nonatomic, strong) UILabel * reflexes;
@property (nonatomic, strong) UILabel * tackling;
@property (nonatomic, strong) UILabel * heading;
@property (nonatomic, strong) UILabel * passing;
@property (nonatomic, strong) UILabel * creativity;
@property (nonatomic, strong) UILabel * crossing;
@property (nonatomic, strong) UILabel * technique;
@property (nonatomic, strong) UILabel * positioning;
@property (nonatomic, strong) UILabel * shooting;
@property (nonatomic, strong) UILabel * dribbling;
@property (nonatomic, strong) UILabel * finishing;
@property (nonatomic, strong) UILabel * firstTouch;
@property (nonatomic, strong) UILabel * composure;
@property (nonatomic, strong) UILabel * agility;
@property (nonatomic, strong) UILabel * teamwork;
@property (nonatomic, strong) UILabel * acceleration;
@property (nonatomic, strong) UILabel * stamina;
@property (nonatomic, strong) UILabel * strength;

@property (nonatomic, assign) int playerId;
@property (nonatomic, strong) NSDictionary * player;

@property (nonatomic, strong) UIScrollView * mainScroll;
@property (nonatomic, strong) UIPageControl * pageControl;

@end
