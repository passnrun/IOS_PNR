//
//  NewsTableViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/24/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewCell.h"
#import "News.h"


@implementation NewsTableViewController

@synthesize newsDetails, newsArray, newsTable;

- (void)getSampleNews
{
    NSMutableArray * news = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i<20; i++) {
        News * n = [[News alloc]init];
        n.id = i + 1;
        n.subject = [NSString stringWithFormat:@"Subject : %i", n.id];
        n.date = @"11.11.11";
        n.content = [NSString stringWithFormat:@"<p>Hey Man</p><p>Did yo hear the news?</p><p>Subject : %i</p>", n.id];
        [news addObject:n];
    }
    newsArray = news;
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:NO];
    [self getSampleNews];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [newsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    NewsTableViewCell *cell = (NewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    News * news = [self.newsArray objectAtIndex:indexPath.row];
    
    cell.subject.text = news.subject;
    cell.date.text = news.date;
    
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
    News * news = [self.newsArray objectAtIndex:indexPath.row];
    NSURL * url = [[NSURL alloc]initWithString:@"http://google.com"];
    [self.newsDetails loadHTMLString:news.content baseURL:url];
}

@end
