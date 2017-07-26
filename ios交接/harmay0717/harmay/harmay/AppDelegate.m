//
//  AppDelegate.m
//  harmay
//
//  Created by boldseas on 2017/7/17.
//  Copyright © 2017年 renbohan. All rights reserved.
//

#import "AppDelegate.h"
#import "HMHomeViewController.h"
#import "HMProfileListViewController.h"
#import "HMPCH.h"
#import "RESideMenu.h"
#import "HMNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    HMHomeViewController *home = [[HMHomeViewController alloc]init];
    HMNavigationController *nav = [[HMNavigationController alloc]initWithRootViewController:home];
    HMProfileListViewController *list = [[HMProfileListViewController alloc]init];
    
    RESideMenu *menuVc = [[RESideMenu alloc]initWithContentViewController:nav leftMenuViewController:list rightMenuViewController:nil];
    
    menuVc.backgroundImage = [UIImage imageNamed:@"Stars"];
    menuVc.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    menuVc.contentViewInPortraitOffsetCenterX = 100;
    menuVc.contentViewShadowColor = [UIColor blackColor];
    menuVc.contentViewShadowOffset = CGSizeMake(0, 0);
    menuVc.contentViewShadowOpacity = 0.6;
    menuVc.contentViewShadowRadius = 12;
    menuVc.contentViewShadowEnabled = YES;
    self.window.rootViewController = menuVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
