//
//  FixtureTableViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/3/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "FixtureTableViewController.h"
#import "SQLLite/SQLLiteManager.h"
#import "FixtureTableViewCell.h"
#import "GameScoreTableViewController.h"


@interface FixtureTableViewController ()
    
@end

@implementation FixtureTableViewController


@synthesize fixtureArray, fixtureTable, dateFormatter, isFixtureDrawn;


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SQLLiteManager * sqlm = [SQLLiteManager instance];
    isFixtureDrawn = NO;
    self.fixtureArray = [sqlm getFixture];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    [self.navigationController.navigationBar setHidden:YES];
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

-(IBAction)backView:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    if (isFixtureDrawn)
        return [self.fixtureArray count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isFixtureDrawn)
    {
        static NSString *CellIdentifier = @"FixtureCell";
        FixtureTableViewCell *cell = (FixtureTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        Fixture * fixture = [self.fixtureArray objectAtIndex:indexPath.row];
        
        if (fixture.isPlayed)
            cell.score.text = [NSString stringWithFormat:@"%i : %i",fixture.homeScore, fixture.awayScore];
        else
            cell.score.text = @"- : -";
        
        cell.homeTeam.text = fixture.homeTeamName;
        cell.awayTeam.text = fixture.awayTeamName;
        
        cell.date.text = fixture.date;
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"EmptyFixtureCell";
        return [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath * indexPath = [fixtureTable indexPathForCell: (UITableViewCell *)[[sender superview] superview]];
    Fixture * fixture = [self.fixtureArray objectAtIndex:indexPath.row];
    GameScoreTableViewController * gsController = [segue destinationViewController];
    gsController.fixture = fixture;
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
