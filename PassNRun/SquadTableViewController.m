//
//  SquadTableViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/25/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "SquadTableViewController.h"
#import "SquadTableViewCell.h"
#import "Common/Player.h"
#import "OnlineServices.h"
#import "SQLLiteManager.h"


@interface SquadTableViewController ()

@end

@implementation SquadTableViewController

@synthesize tactic, selectedCells, swapButton, squadTable, formations, formationPicker, useFormationButton;

const int SECTION_SQUAD         = 0;
const int SECTION_SUBSTITUTES   = 1;

- (NSArray *) getPositionListForSelectedFormation:(NSInteger)index
{
    if(index == 0)
        return @[@"GK",@"D(L)",@"D(C)",@"D(C)",@"D(R)",@"M(L)",@"M(C)",@"M(C)",@"M(R)",@"ST",@"ST"];
    else if (index == 1)
        return @[@"GK",@"D(L)",@"D(C)",@"D(C)",@"D(R)",@"M(L)",@"M(C)",@"M(C)",@"M(C)",@"M(R)",@"ST"];
    else if (index == 2)
        return @[@"GK",@"D(C)",@"D(C)",@"D(C)",@"M(L)",@"M(C)",@"M(C)",@"M(C)",@"M(R)",@"ST",@"ST"];
    else if (index == 3)
        return @[@"GK",@"D(L)",@"D(C)",@"D(C)",@"D(R)",@"M(C)",@"M(C)",@"M(C)",@"ST",@"ST",@"ST"];
    else
        return @[@"GK",@"D(L)",@"D(C)",@"D(C)",@"D(R)",@"M(L)",@"M(C)",@"M(C)",@"M(R)",@"ST",@"ST"];
}

- (Player *) getPlayerFrom:(NSIndexPath *)indexpath
{
    if (indexpath.section == SECTION_SQUAD)
        return [tactic.squad objectAtIndex:indexpath.row];
    else
        return [tactic.substitutes objectAtIndex:indexpath.row];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SQLLiteManager *sqlm=[SQLLiteManager instance];
    [swapButton setEnabled:NO];
    selectedCells = [[NSMutableArray alloc]initWithCapacity:2];
    Response * resp = [OnlineServices getSquad:[sqlm getLocalCurrent].managerId];
    tactic = (Tactic *)resp.object;
    self.formations = @[@"4-4-2",@"4-5-1",@"3-5-2",@"4-3-3"];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == SECTION_SQUAD)
        return [tactic.squad count];
    else
        return [tactic.substitutes count];
}

- (void) setCellInformation:(SquadTableViewCell *)cell withPlayer:(Player *)player
{
    cell.playerName.text = [NSString stringWithFormat:@"%@ (%i)", player.name, player.age];
    cell.position.text = player.position;
    cell.playerNativePosition.text = player.nativePosition;
    cell.latestForm.text = player.latestForm;
    cell.playerAge.text = player.quality;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SquadCell";
    SquadTableViewCell *cell =
        (SquadTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Player * player = [self getPlayerFrom:indexPath];
    [self setCellInformation:cell withPlayer:player];
    
    return cell;
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
    
    if([selectedCells count] == 2){
        NSIndexPath * previoslySelectedIndexPath = [selectedCells lastObject];
        [tableView deselectRowAtIndexPath:previoslySelectedIndexPath animated:YES];
        [selectedCells removeLastObject];
    }
    [selectedCells addObject:indexPath];
    [swapButton setEnabled:([selectedCells count] == 2)];

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([selectedCells containsObject:indexPath])
        [selectedCells removeObject:indexPath];
    [swapButton setEnabled:([selectedCells count] == 2)];
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [self.formations count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return  [self.formations objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

#pragma mark - Squad Table methods

-(IBAction)switchPlayers:(id)sender{
    NSIndexPath * indexPath1 = [selectedCells objectAtIndex:0];
    NSIndexPath * indexPath2 = [selectedCells objectAtIndex:1];
    
    
    Player * player1 = [self getPlayerFrom:indexPath1];
    NSString * tempPosition = player1.position;
    Player * player2 = [self getPlayerFrom:indexPath2];
    player1.position = player2.position;
    player2.position = tempPosition;
    
    NSMutableArray * tempArray = [[NSMutableArray alloc]initWithCapacity:18];
    for (Player * p in tactic.squad) {
        if (p == player1)
            [tempArray addObject:player2];
        else if (p == player2)
            [tempArray addObject:player1];
        else
            [tempArray addObject:p];
    }
    tactic.squad = tempArray;
    
    tempArray = [[NSMutableArray alloc]initWithCapacity:18];
    for (Player * p in tactic.substitutes) {
        if (p == player1)
            [tempArray addObject:player2];
        else if (p == player2)
            [tempArray addObject:player1];
        else
            [tempArray addObject:p];
    }
    tactic.substitutes = tempArray;
    
    [self.squadTable deselectRowAtIndexPath:indexPath1 animated:YES];
    [self.squadTable deselectRowAtIndexPath:indexPath2 animated:YES];
    
    [selectedCells removeAllObjects];
    
    [self.swapButton setEnabled:NO];
    [self.squadTable reloadData];
}

- (void)saveSquad:(id)sender
{
    Response * resp = [OnlineServices saveSquad:tactic];
    NSString * message = @"Saved";
    if (!resp.isSuccessful)
        message = resp.errorMessage;
    else{
        resp = [OnlineServices getSquad:1];
        tactic = (Tactic *)resp.object;
        [self.squadTable reloadData];
    }
        
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)formation:(id)sender
{
    [formationPicker setHidden:NO];
    [useFormationButton setHidden:NO];
}

- (void)setFormation:(id)sender
{
    NSInteger index = [formationPicker selectedRowInComponent:0];
    NSArray * positionList = [self getPositionListForSelectedFormation:index];
    for (int i = 0; i < [positionList count]; i++) {
        Player * p = [tactic.squad objectAtIndex:i];
        p.position = [positionList objectAtIndex:i];
    }
    [formationPicker setHidden:YES];
    [useFormationButton setHidden:YES];
    [selectedCells removeAllObjects];
    
    [self.swapButton setEnabled:NO];
    [self.squadTable reloadData];

}

@end
