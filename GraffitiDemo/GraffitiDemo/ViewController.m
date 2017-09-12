//
//  ViewController.m
//  GraffitiDemo
//
//  Created by wangyang on 2017/9/12.
//  Copyright © 2017年 wangyang. All rights reserved.
//

#import "ViewController.h"
#import "WYDrawLineView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYDrawLineView *touchdrawView = [[WYDrawLineView alloc] initWithFrame:self.view.frame];
    
    touchdrawView.drawLineColor = [UIColor blackColor];
    touchdrawView.drawLineWidth = 2;
    [self.view addSubview:touchdrawView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
