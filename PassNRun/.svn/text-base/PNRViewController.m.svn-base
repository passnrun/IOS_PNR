//
//  PNRViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/2/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "PNRViewController.h"

@interface PNRViewController ()

@end

@implementation PNRViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void)showRegister{
    NSLog(@"Displaying Register View");
    [self performSegueWithIdentifier: @"Register Segue" sender: self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];

}

- (void)resign:(id)sender
{
    UIActionSheet *popupQuery =
    [[UIActionSheet alloc] initWithTitle:@"Resign and Delete all you Manager Data?" delegate:self cancelButtonTitle:@"No No No.. Wait.." destructiveButtonTitle:@"Yes, Delete!"
                       otherButtonTitles:nil, nil];
    
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
    [popupQuery release];
    if (1!=1)
    {
        

    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        NSLog(@"User decided to remove all data");
        SQLLiteManager *sqlm=[SQLLiteManager instance];
        Current * local = [sqlm getLocalCurrent];
        Response * response = [OnlineServices resign:local.managerId];
        if (response.isSuccessful){
            [sqlm deleteManagerWith:local.managerId];
            id _id = [[NSThread mainThread] exit];
        }
    
    }
}

-(void) viewDidAppear:(BOOL)animated{
    SQLLiteManager *sqlm=[SQLLiteManager instance];
    NSLog(@"An instance for SQLLiteManager is created");
    Current * local = [sqlm getLocalCurrent];
	if (local == nil) {
		NSLog(@"Local DB doesnt have a manager, redirecting to Register View");
        [self showRegister];
    }
    else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^ {
            NSLog(@"Syncing for ManagerId[%i]", local.managerId);
            Response * response = [OnlineServices sync:local.managerId];
            if (!response.isSuccessful) {
                NSLog(@"%@",response.errorMessage);
                return ;
            }
            Current * server = (Current*)response.object;
            BOOL ok = TRUE;
            if (local.seasonId != server.seasonId || local.leagueId != server.leagueId)
            {
                NSLog(@"Processing new season creation");
                ok = [sqlm clearTablesForNewSeason];
                response = [OnlineServices getTeamList:server.leagueId];
                if (!response.isSuccessful) {
                    NSLog(@"%@",response.errorMessage);
                    return ;
                }
                NSArray * teams = (NSArray *)response.object;
                for (Team * team in teams) {
                    ok = ok && [sqlm insertTeam:team];
                }
                if (ok) {
                    local.leagueId = server.leagueId;
                    local.seasonId = server.seasonId;
                    [sqlm updateManagerWith:local.leagueId And:local.seasonId];
                }
            }
            if (local.maxGames != server.maxGames)
            {
                if (local.maxGames == -1)
                {
                    response = [OnlineServices getFixture:server.seasonId :server.leagueId];
                    if (!response.isSuccessful) {
                        NSLog(@"%@",response.errorMessage);
                        return ;
                    }
                    NSArray * games = (NSArray *)response.object;
                    for (Game * game in games)
                    {
                        ok = ok && [sqlm insertGame:game];
                    }
                    if (ok){
                        ok = [sqlm updateFixtureStatus];
                        local.maxGames = 0;
                    }
                }
                if (server.maxGames != local.maxGames) {
                    response = [OnlineServices getGameResultList:local.maxGames :local.managerId];
                    if (!response.isSuccessful) {
                        NSLog(@"%@",response.errorMessage);
                        return ;
                    }
                    NSArray * gameResults = (NSArray *)response.object;
                    for (GameResult * gameResult in gameResults)
                    {
                        ok = ok && [sqlm updateGameResult:gameResult];
                    }
                }
            }
            
        });
    }
}

@end
