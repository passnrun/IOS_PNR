//
//  PNRAppDelegate.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/2/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import "PNRAppDelegate.h"

@implementation PNRAppDelegate

@synthesize deviceTokenStr;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"application did finish launching");
    NSString *preferredLang = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"prefered language is : %@", preferredLang);
    [[UIApplication sharedApplication]
     registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                         UIRemoteNotificationTypeSound)];
    return YES;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Error in registration. Error: %@", error);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    deviceTokenStr =
    [[NSString alloc] initWithString: [[[[deviceToken description]
        stringByReplacingOccurrencesOfString: @"<" withString: @""]
        stringByReplacingOccurrencesOfString: @">" withString: @""]
        stringByReplacingOccurrencesOfString: @" " withString: @""]];
    NSLog(@"register for notification :%@", deviceTokenStr);
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
