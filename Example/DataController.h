//
//  DataController.h
//  SVEApplicationDelegate
//
//  Created by Sérgio Estêvão on 01/01/2014.
//  Copyright (c) 2014 Sérgio Estêvão. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject <UIApplicationDelegate>

+ (instancetype) sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

@end
