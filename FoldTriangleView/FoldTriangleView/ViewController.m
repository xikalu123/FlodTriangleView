//
//  ViewController.m
//  FoldTriangleView
//
//  Created by 陈宇亮 on 2018/2/4.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import "ViewController.h"
#import "AliCustomView.h"

@interface ViewController ()

@property (nonatomic, strong) AliCustomView *customView;
@property (nonatomic, strong) AliCustomViewStyleConfig *config;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _config = [[AliCustomViewStyleConfig alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"viewConfig" ofType:@"json"]];
    [self customView];
}

- (AliCustomView *)customView
{
    if (!_customView) {
        _customView = [[AliCustomView alloc]initWithFrame:CGRectMake(20, 100, 100, 100) styleConfig:_config];
        [self.view addSubview:_customView];
    }
    return _customView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
