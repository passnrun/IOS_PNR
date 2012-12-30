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
#import "OnlineServices.h"

@interface GameScoreTableViewController ()

@end

@implementation GameScoreTableViewController

@synthesize homeTeam, awayTeam, score, gameScore, fixture, gameActionsTableView;


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    homeTeam.text = fixture.homeTeamName;
    awayTeam.text = fixture.awayTeamName;
    score.text = [NSString stringWithFormat:@"%i - %i", fixture.homeScore, fixture.awayScore];
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
    return [gameScore.gameScoreItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
