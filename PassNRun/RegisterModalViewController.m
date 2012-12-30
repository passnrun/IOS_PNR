//
//  RegisterModalViewController.m
//  PassNRun
//
//  Created by oral on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterModalViewController.h"
#import "PNRAppDelegate.h"


@implementation RegisterModalViewController

@synthesize nameTextField,surnameTextField,arrNation,arrLanguage, teamTextField;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrLanguage=@[@"TURKISH",@"ENGLISH",@"iTALIAN"];
    arrNation= @[@"TURKEY",@"GERMANY",@"ITALIAN",@"SOUTH AFRICA"];
    
    
    languageBox = [[ComboBox alloc] init];
    [languageBox setComboData:[arrLanguage mutableCopy]];  //Assign the array to ComboBox
    [self.view addSubview:languageBox.view];
    languageBox.view.frame = CGRectMake(168, 230, 117, 31);  //ComboBox location and size (x,y,width,height)
    
    
    nationalityBox = [[ComboBox alloc] init];
    [nationalityBox setComboData:[arrNation mutableCopy]];  //Assign the array to ComboBox
    [self.view addSubview:nationalityBox.view];
    nationalityBox.view.frame = CGRectMake(168, 187, 117, 31);  //ComboBox location and size (x,y,width,height)
    /*
    birthDateBox = [[DatePicker alloc] init];
    [birthDateBox setFormat:@"dd/MM/yyyy"];
    [self.view addSubview:birthDateBox.view];
    birthDateBox.view.frame = CGRectMake(168, 273, 117, 31);  //ComboBox location and size (x,y,width,height)
     */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(IBAction)sendData:(id)sender{
    SQLLiteManager *sqlm=[SQLLiteManager instance];
    PNRAppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    Response * response = [OnlineServices registr:nameTextField.text
                               :surnameTextField.text
                               :teamTextField.text
                               :[nationalityBox selectedText]
                               :[languageBox selectedText]
                               :@""
                               :delegate.deviceTokenStr] ;
    
     if (!response.isSuccessful) {
        NSLog(@"Error in Register %@ ",response.errorMessage);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:response.errorMessage
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else {
        Current * current = (Current *)response.object;
        [sqlm insertManagerWith:current.managerId And:current.teamId];
        [self dismissModalViewControllerAnimated:YES];
    }
}





@end
