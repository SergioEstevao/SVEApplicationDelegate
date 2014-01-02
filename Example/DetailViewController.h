//
//  DetailViewController.h
//  Example
//
//  Created by Sérgio Estêvão on 01/01/2014.
//  Copyright (c) 2014 Sérgio Estêvão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
