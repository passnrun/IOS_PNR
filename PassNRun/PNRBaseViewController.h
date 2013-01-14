//
//  PNRBaseViewController.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 1/14/13.
//  Copyright (c) 2013 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Response.h"

@interface PNRBaseViewController : UIViewController
{
    IBOutlet UIView * loadingView;
}

-(IBAction)backView:(id)sender;
-(Response *) queryFormData;
-(void) loadFormData :(NSObject *) object;

@property (nonatomic, strong) UIView * loadingView;

@end
