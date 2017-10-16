//
//  UIView+UILogger.m
//  UILogger-Example
//
//  Created by Steven Petteruti on 10/15/17.
//  Copyright © 2017 Steven Petteruti. All rights reserved.
//

#import "UIView+UILogger.h"
#import <objc/runtime.h>

@implementation UIView (UILogger)

/*
 *  swizzles the implementation of didAddSubview: with logView:
 *
 *  source: http://nshipster.com/method-swizzling/
 */
- (void)logElementsOnView
{
    Class class = [self class];
    
    SEL originalSelector = @selector(didAddSubview:);
    SEL swizzledSelector = @selector(logView:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

/*
 *  method to be swizzled!
 */
- (void)logView:(UIView *)subview
{
    if ([self ignoreClass:subview.class] == NO)
    {
        [self printFormattedView:subview];
    }
}

/*
 *  didLayoutSubview: is called on a few extraneous objects on the screen. We can filter these objects out
 */
- (BOOL)ignoreClass:(Class)class
{
    
    // TODO: move this logic to a config file
    NSArray *ignoreClasses = @[@"UIStatusBar",
                               @"UIStatusBarForegroundView",
                               @"UIStatusBarBackgroundView",
                               @"UIStatusBarServiceItemView",
                               @"UIStatusBarDataNetworkItemView",
                               @"UIStatusBarBatteryItemView",
                               @"UIStatusBarTimeItemView",
                               @"_UILayoutGuide",
                               ];
    
    if ([ignoreClasses containsObject:NSStringFromClass(class)] )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/*
 *  prints the contents of each UIView
 */
- (void)printFormattedView:(UIView *)view
{
    if (view.backgroundColor != nil)
    {
        NSLog(@"\nadded subview:\n   class: %@\n   frame: %@\n   id: %p\n   bg-color:   %@", NSStringFromClass(view.class), NSStringFromCGRect(view.frame), view, [self hexStringFromColor:view.backgroundColor]);
    }
    else
    {   // no bg color available
        NSLog(@"\nadded subview:\n   class: %@\n   frame: %@\n   id: %p", NSStringFromClass(view.class), NSStringFromCGRect(view.frame), view);
    }
}


/*
 * helper method to get hex from uicolor (source stackoverflow)
 * TODO: move this logic to a utility class
 */
 
- (NSString *)hexStringFromColor:(UIColor *)color {

    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
