//
//  MackenzieAppDelegate.m
//  Navigation
//
//  Created by Vinicius Miana on 2/21/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieAppDelegate.h"
#import "ImagemGrandeViewController.h"
#import "DicionarioTableViewController.h"

@implementation MackenzieAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [[Letra alloc] initWithLetra:@"A" andImagem:@"arvore" andPalavra:@"Árvore"];
    
    DicionarioTableViewController *dtvc = [[DicionarioTableViewController alloc] init];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:igvc];
    
    self.tabBarController.viewControllers = @[self.navigationController,dtvc];
    
    igvc.navigationController.tabBarItem.title = @"Navegaçāo";
    igvc.navigationController.tabBarItem.image = [UIImage imageNamed:@"turtle-26.png"];
    dtvc.tabBarItem.title = @"Dicionário";
    dtvc.tabBarItem.image = [UIImage imageNamed:@"book-26.png"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
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
