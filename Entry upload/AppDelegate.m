//
//  AppDelegate.m
//  Entry upload
//
//  Created by 林晓龙 on 14-4-10.
//  Copyright (c) 2014年 qc. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate
@synthesize window;
@synthesize navController;
@synthesize viewController;


//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    ViewController *rtCtr = [[ViewController alloc] init];
//    self.navController = [[UINavigationController alloc]initWithRootViewController:rtCtr];
//    self.navController.navigationBarHidden = YES;
//    CGRect r = [UIScreen mainScreen].applicationFrame;
//    rtCtr = [[UIView alloc]initWithFrame:r];
//    [window addSubview:navController.view];
//    [rtCtr release];
//    [window makeKeyAndVisible];
//
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    ViewController *rootView = [[ViewController alloc] init];
//    
//    [rootView title:@"Root View"];
//    self.navController = [[UINavigationController alloc] init];
//    [self.navController pushViewController:rootView animated:YES];
//    [self.window addSubview:self.navController.view];
//    [self.window makeKeyAndVisible];
//    // Override point for customization after application launch.
//    return YES;
//}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *rootView = [[ViewController alloc] init];
//    rootView.title = @"rootview";
    
//    [rootView title:@"Root View"];
    self.navController = [[UINavigationController alloc] init];
    
    [self.window addSubview:self.navController.view];
    
    [self.navController pushViewController:rootView animated:YES];
    self.navController.navigationBarHidden = YES;
    [self.window makeKeyAndVisible];
//    ViewController *rtCtr = [[ViewController alloc] init];
//    self.navController = [[UINavigationController alloc]initWithRootViewController:rtCtr];
//    self.navController.navigationBarHidden = YES;
//    CGRect r = [UIScreen mainScreen].applicationFrame;
//    rtCtr = [[UIView alloc]initWithFrame:r];
////    [self.navController pushViewController:rtCtr animated:YES];
//    [window addSubview: self.navController.view];
//    [rtCtr release];
//    [window makeKeyAndVisible];
    [rootView release];
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
-(void)dealloc
{
    [navController release];
    [window release];
    [viewController release];
    [super dealloc];
}

@end
