//
//  GameScoreTableViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/8/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "GameScoreTableViewController.h"
#import "GameScoreTableViewCell.h"
#import "Common/GameScoreItem.h"
#import "PlayerPerformanceTableViewCell.h"
#import "OnlineServices.h"


@interface GameScoreTableViewController ()

@end

@implementation GameScoreTableViewController

@synthesize homeTeam, awayTeam, score, gameScore, fixture, gameActionsTableView, mainScroll, pageControl, gameDetailWebView, teamPlayersPerformance,homeTeamStatsTableView,awayTeamStatsTableView,subTitle,attendance, titleGoal,titleAssist,titleForm,titleMorale;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [mainScroll setContentSize:CGSizeMake(1200, 1)];
    Response * response = [OnlineServices getGameDetailList:fixture.gameId :1];
    if (response.isSuccessful)
    {
        gameScore = [[GameScore alloc]init];
        gameScore.gameScoreItems = (NSArray *)response.object;
    }else {
            NSLog(@"Error in Game Detail Service %@ ",response.errorMessage);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response.errorMessage
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
    }
    response = [OnlineServices getGameTeamStats:fixture.gameId];
    if (response.isSuccessful)
    {
        teamPlayersPerformance = (TeamPlayerPerformance *)response.object;
    }else {
        NSLog(@"Error in Team Player Performance Service %@ ",response.errorMessage);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response.errorMessage
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    homeTeam.text = fixture.homeTeamName;
    awayTeam.text = fixture.awayTeamName;
    score.text = [NSString stringWithFormat:@"%i - %i", fixture.homeScore, fixture.awayScore];
    subTitle.text = @"Game Summary";
    attendance.text = [NSString stringWithFormat:@"Attendance : %i", fixture.attendance];
    [gameDetailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://pickledphotos.com/passnrun/GameDetail?gameId=%i", fixture.gameId]]]];
}


- (void)changeTitleVisibility:(BOOL)isHidden
{
    [titleForm setHidden:isHidden];
    [titleGoal setHidden:isHidden];
    [titleAssist setHidden:isHidden];
    [titleMorale setHidden:isHidden];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == gameActionsTableView)
        return [gameScore.gameScoreItems count];
    else if (tableView == homeTeamStatsTableView)
        return [teamPlayersPerformance.homeTeam count];
    else if (tableView == awayTeamStatsTableView)
        return [teamPlayersPerformance.awayTeam count];
        
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == gameActionsTableView)
    {
        static NSString *CellIdentifier = @"GameScoreItem";
        GameScoreTableViewCell *cell = (GameScoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        GameScoreItem * item = [gameScore.gameScoreItems objectAtIndex:indexPath.row];
        cell.minute.text = [NSString stringWithFormat:@"%i", item.minute];
        
        if (item.team == 0){
            cell.homePlayer.text = item.player;
            cell.homeActionImage.image = [item actionImage];
            cell.awayPlayer.text = @"";
        }else{
            cell.awayPlayer.text = item.player;
            cell.awayActionImage.image = [item actionImage];
            cell.homePlayer.text = @"";
        }
        return cell;
    }
    else if (tableView == homeTeamStatsTableView)
    {
        static NSString * CellIdentifier = @"HomePlayerStats";
        PlayerPerformanceTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        PlayerPerformance * pp = [teamPlayersPerformance.homeTeam objectAtIndex:indexPath.row];
        [cell setPlayerPerformance:pp];
        return cell;
    }
    else if (tableView == awayTeamStatsTableView)
    {
        static NSString * CellIdentifier = @"AwayPlayerStats";
        PlayerPerformanceTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        PlayerPerformance * pp = [teamPlayersPerformance.awayTeam objectAtIndex:indexPath.row];
        [cell setPlayerPerformance:pp];
        return cell;
    }
}

-(IBAction)backView:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = 300;
    int page = floor((mainScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    switch (page) {
        case 0:
            subTitle.text = @"Game Summary";
            [self changeTitleVisibility:YES];
            break;
        case 1:
            subTitle.text = @"Game Story";
            [self changeTitleVisibility:YES];
            break;
        case 2:
            subTitle.text = [NSString stringWithFormat:@"%@ Stats", fixture.homeTeamName];
            [self changeTitleVisibility:NO];
            break;
        case 3:
            subTitle.text = [NSString stringWithFormat:@"%@ Stats", fixture.awayTeamName];
            [self changeTitleVisibility:NO];
            break;
        default:
            subTitle.text = @"";
            break;
    }
}


@end
