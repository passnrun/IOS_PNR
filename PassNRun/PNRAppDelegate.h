//
//  PNRAppDelegate.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/2/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNRAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString * deviceTokenStr;
}


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *deviceTokenStr;

@end
