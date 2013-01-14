//
//  PNRBaseViewController.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/14/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import "PNRBaseViewController.h"

@interface PNRBaseViewController ()

@end

@implementation PNRBaseViewController
@synthesize loadingView;

- (Response *)queryFormData
{
    Response * resp = [[Response alloc]init];
    resp.isSuccessful = YES;
    return resp;
}

- (void)loadFormData:(NSObject *)object{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    loadingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    [loadingView setHidden:NO];
    [loadingView setBackgroundColor:[UIColor darkGrayColor]];
    [loadingView setAlpha:0.8];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = CGPointMake(160, 240);
    activityIndicator.hidesWhenStopped = NO;
    [loadingView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    [self.view addSubview:loadingView];
    dispatch_async(dispatch_get_global_queue(0, 0), ^ {
        Response * response = [self queryFormData];
        dispatch_async( dispatch_get_main_queue(), ^{
            if (response.isSuccessful)
            {
                [self loadFormData:response.object];
                [loadingView setHidden:YES];
            }else {
                NSLog(@"Error in Player Detail Service %@ ",response.errorMessage);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response.errorMessage
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                [alert release];
            }
        });
        
    });
}

-(IBAction)backView:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
