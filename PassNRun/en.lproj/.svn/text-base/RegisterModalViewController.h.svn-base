//
//  RegisterModalViewController.h
//  PassNRun
//
//  Created by oral on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Current.h"
#import "OnlineServices.h"
#import "SQLLiteManager.h"
#import "ComboBox.h"
#import "DatePicker.h"


@interface RegisterModalViewController : UIViewController{
    
    
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *surnameTextField;
    IBOutlet UITextField *teamTextField;
    NSArray *arrLanguage;
    NSArray *arrNation;

    ComboBox * nationalityBox;
    ComboBox * languageBox;
    DatePicker * birthDateBox;
}


@property(nonatomic,retain)NSArray *arrLanguage;
@property(nonatomic,retain)NSArray *arrNation;
@property(nonatomic,retain) UITextField *nameTextField;
@property(nonatomic,retain) UITextField *surnameTextField;
@property(nonatomic,retain) UITextField *teamTextField;
@property(nonatomic,retain) ComboBox * nationalityBox;
@property(nonatomic,retain) ComboBox * languageBox;
@property(nonatomic,retain) DatePicker * birthDateBox;


-(IBAction)sendData:(id)sender;
@end
