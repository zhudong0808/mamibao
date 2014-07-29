//
//  MmbHomeViewController.m
//  mamibao
//
//  Created by zhudong on 14-7-29.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbHomeViewController.h"

@interface MmbHomeViewController ()

@end

@implementation MmbHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.naviBar.centerBarItem = [MmbViewUtil simpleLabel:CGRectMake(0, 0, 100, 44) bf:24 tc:[UIColor whiteColor] t:@"妈咪宝"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
