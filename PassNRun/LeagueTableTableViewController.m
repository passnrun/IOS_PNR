//
//  LeagueTableTableViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/4/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "LeagueTableTableViewController.h"
#import "SQLLite/SQLLiteManager.h"
#import "LeagueTableViewCell.h"

@interface LeagueTableTableViewController ()

@end

@implementation LeagueTableTableViewController

@synthesize leagueTableArray, leagueTableView,imageCell, isLeagueDrawn;



- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SQLLiteManager * sqlm = [SQLLiteManager instance];
    self.leagueTableArray = [sqlm getLeagueTable];
    isLeagueDrawn = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    if (isLeagueDrawn)
        return [leagueTableArray count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isLeagueDrawn)
    {
        static NSString *CellIdentifier = @"LeagueTableCell";
        LeagueTableViewCell *cell = (LeagueTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        LeagueTableRow * row = [self.leagueTableArray objectAtIndex:indexPath.row];
        
        cell.rank.text      = [NSString stringWithFormat:@"%i",(indexPath.row+1)];
        cell.team.text      = row.teamName;
        cell.played.text    = [NSString stringWithFormat:@"%i",row.played];
        cell.win.text       = [NSString stringWithFormat:@"%i",row.won];
        cell.draw.text      = [NSString stringWithFormat:@"%i",row.draw];
        cell.lost.text      = [NSString stringWithFormat:@"%i",row.lost];
        cell.forGoals.text  = [NSString stringWithFormat:@"%i",row.forGoals];
        cell.againstGoals.text =[NSString stringWithFormat:@"%i",row.againstGoals];
        cell.avgGoals.text =[NSString stringWithFormat:@"%i",row.forGoals-row.againstGoals];
        cell.points.text = [NSString stringWithFormat:@"%i",row.points];
        
        return cell;
    }else{
        static NSString *CellIdentifier = @"EmptyLeagueTableCell";
        return [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
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
