//
//  PageContentViewController.h
//  MyParty
//
//  Created by Admin on 15.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (nonatomic, strong) UINavigationController *parentNavigationController;
@property NSUInteger pageIndex;
@property NSString *imageURL;

@end
