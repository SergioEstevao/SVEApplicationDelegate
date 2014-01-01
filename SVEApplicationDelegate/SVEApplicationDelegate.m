//
//  SVEApplicationDelegate.m
//
// Copyright (c) 2013 Sergio Estevao (http://sergioestevao.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SVEApplicationDelegate.h"

@interface SVEApplicationDelegate ()

@end

@implementation SVEApplicationDelegate

- (NSArray *) services {
    return nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]){
            [service application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationWillResignActive:)]){
            [service applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]){
            [service applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationWillEnterForeground:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationDidBecomeActive:)]){
            [service applicationDidBecomeActive:application];
        }
    }

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationWillTerminate:)]){
            [service applicationWillTerminate:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    id<UIApplicationDelegate> service;
    BOOL result = NO;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]){
            result |= [service application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    id<UIApplicationDelegate> service;
    BOOL result = NO;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:handleOpenURL:)]){
            result |= [service application:application handleOpenURL:url];
        }
    }
    return result;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]){
            [service application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }

}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]){
            [service application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didReceiveLocalNotification:)]){
            [service application:application didReceiveLocalNotification:notification];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didReceiveRemoteNotification:)]){
            [service application:application didReceiveRemoteNotification:userInfo];
        }
    }

}

@end
