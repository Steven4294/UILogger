//
//  UIViewController+UILogger.h
//  UILogger-Example
//
//  Created by Steven Petteruti on 10/15/17.
//  Copyright © 2017 Steven Petteruti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UILogger)

/*
 *  call this method in viewDidLoad: to log all elements as they appear on the screen
 */

- (void)logElementsThatWillAppear;

@end
