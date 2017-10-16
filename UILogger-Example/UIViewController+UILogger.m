//
//  UIViewController+UILogger.m
//  UILogger-Example
//
//  Created by Steven Petteruti on 10/15/17.
//  Copyright © 2017 Steven Petteruti. All rights reserved.
//

#import "UIViewController+UILogger.h"
#import "UIView+UILogger.h"

@implementation UIViewController (UILogger)

- (void)logElementsThatWillAppear
{
    
    [self.view logElementsOnView];
}



@end
