//
//  ViewController.m
//  ObjcMethodSwizzling
//
//  Created by AlanYen on 2015/9/4.
//  Copyright (c) 2015年 17Life. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"bundle"];
    NSLog(@"%@", path);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
