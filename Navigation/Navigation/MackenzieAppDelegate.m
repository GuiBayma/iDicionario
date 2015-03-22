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
#import "BuscaViewController.h"
#import "Alfabeto.h"

@implementation MackenzieAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Inicia/recupera a instancia de Alfabeto
    Alfabeto *a = [Alfabeto sharedInstance];
    
    //Cria a ViewController para buscar uma palavra do dicionario, com Navigation
    BuscaViewController *bvc = [[BuscaViewController alloc] init];
    UINavigationController *buscaNav = [[UINavigationController alloc] initWithRootViewController:bvc];

    //Cria a ViewController que exibe as palavras do dicionario, com Navigation
    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [a.abecedario firstObject];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:igvc];
    
    //Cria a TableView que exibe todas as letras do dicionario
    DicionarioTableViewController *dtvc = [[DicionarioTableViewController alloc] init];
    
    //Cria a TabBarController
    self.tabBarController = [[UITabBarController alloc] init];
    
    //Coloca as ViewsControllers dentro da TabBar, na ordem em que devem aparecer
    self.tabBarController.viewControllers = @[buscaNav,self.navigationController,dtvc];
    
    //Coloca o nome e imagem dos icones das views na TabBar
    bvc.navigationController.tabBarItem.title = @"Busca";
    bvc.navigationController.tabBarItem.image = [UIImage imageNamed:@"search-26.png"];
    igvc.navigationController.tabBarItem.title = @"Navegaçāo";
    igvc.navigationController.tabBarItem.image = [UIImage imageNamed:@"turtle-26.png"];
    dtvc.tabBarItem.title = @"Dicionário";
    dtvc.tabBarItem.image = [UIImage imageNamed:@"book-26.png"];
    
    //Cria a window e coloca a TabBar como root
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
