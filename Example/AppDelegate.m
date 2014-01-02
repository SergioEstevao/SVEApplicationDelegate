//
//  AppDelegate.m
//  Example
//
//  Created by Sérgio Estêvão on 01/01/2014.
//  Copyright (c) 2014 Sérgio Estêvão. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"
#import "DataController.h"
#import "PushNotificationController.h"
#import "LocationController.h"

@implementation AppDelegate

- (NSArray *) services {
    static NSArray * _services;
    static dispatch_once_t _onceTokenServices;
    dispatch_once(&_onceTokenServices, ^{
        _services = @[[DataController sharedInstance], [PushNotificationController sharedInstance], [LocationController sharedInstance]];
    });
    return _services;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
        
        UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
        MasterViewController *controller = (MasterViewController *)masterNavigationController.topViewController;
        controller.managedObjectContext = [DataController sharedInstance].managedObjectContext;
    } else {
        UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
        MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
        controller.managedObjectContext = [DataController sharedInstance].managedObjectContext;
    }
    return YES;
}

@end
