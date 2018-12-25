//
//  ViewController.m
//  MyProject
//
//  Created by xuefu ju on 2018/12/25.
//  Copyright © 2018 xuefu ju. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FFPerson *p = [FFPerson new];
    p.name = @"小芳";
    [p eat];
}


@end
