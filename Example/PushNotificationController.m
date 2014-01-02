//
//  PushNotificationController.m
//  SVEApplicationDelegate
//
//  Created by Sérgio Estêvão on 02/01/2014.
//  Copyright (c) 2014 Sérgio Estêvão. All rights reserved.
//

#import "PushNotificationController.h"

@implementation PushNotificationController 

+ (instancetype) sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t _onceToken;
    dispatch_once(&_onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    
    return _sharedInstance;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeSound |
     UIRemoteNotificationTypeAlert];
    
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        [self application:application didReceiveRemoteNotification:launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"RemoteNotification DeviceToken:%@",[NSString stringWithUTF8String:[deviceToken bytes]]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"RemoteNotification Error:%@",[error localizedDescription]);
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"RemoteNotification Arrived: %@", userInfo);
}

@end
