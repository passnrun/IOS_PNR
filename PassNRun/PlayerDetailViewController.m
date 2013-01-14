//
//  PlayerDetailViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/9/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import "PlayerDetailViewController.h"
#import "Response.h"
#import "OnlineServices.h"

@interface PlayerDetailViewController ()

@end

@implementation PlayerDetailViewController
@synthesize age,appearence,assist,avgRating,team,morale,pageControl,position,bans,birthdate,condition,latestForm,nationality,goals,injury,mainScroll,player,playerId,passing,acceleration,agility,shooting,stamina,strength,tackling,heading,handling,finishing,firstTouch,dribbling,teamwork,technique,composure,creativity,crossing,positioning,playerName,reflexes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (Response *)queryFormData
{
    return [OnlineServices getPlayerDetail:playerId];
}

- (void)loadFormData:(NSObject *)object
{
    player = (NSDictionary *)object;
    [self fillFormValues];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [mainScroll setContentSize:CGSizeMake(600, 1)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = 300;
    int page = floor((mainScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

- (void) fillFormValues
{
    NSDictionary * teamObj = [player valueForKey:@"team"];
    playerName.text = [player valueForKey:@"name"];
    age.text = [player valueForKey:@"age"];
    position.text = [player valueForKey:@"position"];
    team.text = [teamObj valueForKey:@"name"];
    birthdate.text = [player valueForKey:@"birthdate"];
    nationality.text = [player valueForKey:@"age"];
    condition.text = [player valueForKey:@"fitness"];
    morale.text = [player valueForKey:@"morale"];
    injury.text = @"none";
    bans.text = @"none";
    NSDictionary * perf = [player valueForKey:@"seasonPerf"];
    assist.text = [perf valueForKey:@"assist"];
    avgRating.text = [perf valueForKey:@"form"];
    appearence.text = [perf valueForKey:@"played"];
    latestForm.text = [player valueForKey:@"latestForm"];
    goals.text = [perf valueForKey:@"goal"];
    
    NSDictionary * skill = [player valueForKey:@"skill"];
    handling.text = [skill valueForKey:@"handling"];
	reflexes.text = [skill valueForKey:@"reflexes"];
	tackling.text = [skill valueForKey:@"tackling"];
	heading.text = [skill valueForKey:@"heading"];
	passing.text = [skill valueForKey:@"passing"];
	creativity.text = [skill valueForKey:@"creativity"];
	crossing.text = [skill valueForKey:@"crossing"];
	technique.text = [skill valueForKey:@"technique"];
	positioning.text = [skill valueForKey:@"positioning"];
	shooting.text = [skill valueForKey:@"shooting"];
	dribbling.text = [skill valueForKey:@"dribbling"];
	finishing.text = [skill valueForKey:@"finishing"];
	firstTouch.text = [skill valueForKey:@"firstTouch"];
	composure.text = [skill valueForKey:@"composure"];
	agility.text = [skill valueForKey:@"agility"];
	teamwork.text = [skill valueForKey:@"teamwork"];
	acceleration.text = [skill valueForKey:@"acceleration"];
	stamina.text = [skill valueForKey:@"stamina"];
	strength.text = [skill valueForKey:@"strength"];
}

@end
