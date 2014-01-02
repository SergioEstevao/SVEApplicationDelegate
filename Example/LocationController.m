//
//  LocationController.m
//  SVEApplicationDelegate
//
//  Created by Sérgio Estêvão on 02/01/2014.
//  Copyright (c) 2014 Sérgio Estêvão. All rights reserved.
//

#import "LocationController.h"

@import CoreLocation;

@interface LocationController () <CLLocationManagerDelegate>
@property (readwrite, nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation LocationController

+ (instancetype) sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t _onceToken;
    dispatch_once(&_onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    
    return _sharedInstance;
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ...
    
    if (![CLLocationManager locationServicesEnabled]) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Location Services Disabled", nil)
                                    message:NSLocalizedString(@"You currently have all location services for this device disabled. If you proceed, you will be asked to confirm whether location services should be reenabled.", nil)
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil] show];
    } else {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startMonitoringSignificantLocationChanges];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsLocationKey]) {
        [self.locationManager startUpdatingLocation];
    }
    
    return YES;
}

@end
