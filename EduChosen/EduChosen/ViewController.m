//
//  ViewController.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/21.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "ViewController.h"
#import "NavigationController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "PersonalCenterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabBar];
    [self addViewControllers];
 
}
- (void)initTabBar{
    self.tabBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tabBar.backgroundColor = [UIColor blackColor];

    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;

}
- (void)addViewControllers{
    //b.创建子控制器
    UIImage *homeImgNormal = [UIImage imageNamed:@"tabBar_home_normal"];
    UIImage *homeImgSelected = [UIImage imageNamed:@"tabBar_home_selected"];
    UITabBarItem *homePageItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImgNormal selectedImage:homeImgSelected];
    NavigationController *homeNavigation = [[NavigationController alloc]init];
    homeNavigation.tabBarItem = homePageItem;
    [homeNavigation pushViewController:[[HomeViewController alloc] init] animated:NO];

    UIImage *findImgNormal = [UIImage imageNamed:@"tabBar_find_normal"];
    UIImage *findImgSelected = [UIImage imageNamed:@"tabBar_find_selected"];
    UITabBarItem *findPageItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:findImgNormal selectedImage:findImgSelected];
    NavigationController *findNavigation = [[NavigationController alloc]init];
    findNavigation.tabBarItem = findPageItem;
    [findNavigation pushViewController:[[FindViewController alloc] init] animated:NO];

    UIImage *personalCenterImgNormal = [UIImage imageNamed:@"tabBar_personalCenter_normal"];
    UIImage *personalCenterImgSelected = [UIImage imageNamed:@"tabBar_personalCenter_selected"];
    UITabBarItem *personalCenterPageItem = [[UITabBarItem alloc] initWithTitle:@"我" image:personalCenterImgNormal selectedImage:personalCenterImgSelected];
    NavigationController *personCenterNavigation = [[NavigationController alloc]init];
    personCenterNavigation.tabBarItem = personalCenterPageItem;
    [personCenterNavigation pushViewController:[[PersonalCenterViewController alloc] init] animated:NO];

    //添加子控制器到ITabBarController中
    self.viewControllers = @[homeNavigation,findNavigation,personCenterNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
