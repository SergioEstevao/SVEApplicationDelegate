# SVEApplicationDelegate [![Build Status](https://travis-ci.org/SergioEstevao/SVEApplicationDelegate.png?branch=develop)](https://travis-ci.org/SergioEstevao/SVEApplicationDelegate)                         

A service oriented ApplicationDelegate. Check the rational for this approach [here](http://sergioestevao.com/blog/2014/01/a-better-uiappdelegate/).

SVEApplicationDelegate is tested on iOS 5 and requires ARC. Released under the [MIT license](LICENSE).

## Example

Open up the included Xcode project for an example app and the tests.

## Usage

On your ApplicationDelegate .h file inherit from SVEApplication Delegate.

``` objc
#import "SVEApplicationDelegate.h"

@interface AppDelegate : SVEApplicationDelegate

@end

```

Then in your ApplicationDelegate .m file just add the services you need and just configure your Root Controller and you are done.


``` objc
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
    // Invoke super to startup all the services
    [super application:application didFinishLaunchingWithOptions:launchOptions];

    // Setup the view controllers
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
    controller.managedObjectContext = [DataController sharedInstance].managedObjectContext;

    return YES;
}

```

See the [header](SEJSONViewController/SEJSONViewController.h) for full documentation.

## Installation

Simply add the files in the `SVEApplicationDelegate.h` and `SVEApplicationDelegate.m` to your project or add `SVEApplicationDelegate` to your Podfile if you're using CocoaPods.
