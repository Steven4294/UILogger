//
//  ViewController.m
//  UILogger-Example
//
//  Created by Steven Petteruti on 10/15/17.
//  Copyright © 2017 Steven Petteruti. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+UILogger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self logElementsThatWillAppear];

    // create some elements and add them to the screen
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 50, 50)];
    button.backgroundColor = [UIColor colorWithRed:46.0f/256.0f green:204.0f/256.0f blue:113.0f/256.0f alpha:1.0f];
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 200, 50)];
    label.text = @"this is a label";
    label.layer.borderWidth = 1.0f;
    label.layer.borderColor = [UIColor colorWithRed:52.0f/256.0f green:73.0f/256.0f blue:94.0f/256.0f alpha:1.0f].CGColor;
    [self.view addSubview:label];
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, 200, 200)];
    subView.backgroundColor = [UIColor colorWithRed:236.0f/256.0f green:240.0f/256.0f blue:241.0f/256.0f alpha:1.0f];
    UIButton *button2  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button2.backgroundColor = [UIColor colorWithRed:52.0f/256.0f green:152.0/256.0f blue:219.0f/256.0f alpha:1.0f];
    [subView addSubview:button2];
    [self.view addSubview:subView];
}


@end
