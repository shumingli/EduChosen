//
//  HomeNavigationController.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/21.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController(){

}

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
}

- (void)initNavigationBar{
    self.navigationBar.barStyle = UIBarStyleBlack;

    UIView *bgView = [[UIView alloc] initWithFrame:self.navigationBar.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    [self.navigationBar insertSubview:bgView atIndex:0];
    self.navigationBar.opaque = YES;

    //    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStyleBordered target:self action:@selector(clickLeftButton)];

    //创建一个导航栏集合
    //    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"首页"];
    //创建一个左边按钮
    //    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStyleBordered target:self action:@selector(clickLeftButton)];
    //    //创建一个右边按钮
    //    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightButton)];
    //设置导航栏内容
    //    [navigationItem setTitle:@"雨松MOMO程序世界"];
    //把左右两个按钮添加入导航栏集合中
    //    [navigationItem setLeftBarButtonItem:leftButton];
    //    [navigationItem setRightBarButtonItem:rightButton];
    //把导航栏集合添加入导航栏中，设置动画关闭
    //    [self.navigationBar setItems:[NSArray arrayWithObjects:navigationItem, nil]];
    //    [self.navigationBar pushNavigationItem:navigationItem animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
