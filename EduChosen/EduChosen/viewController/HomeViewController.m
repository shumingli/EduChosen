//
//  HomeViewController.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/21.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "HomeViewController.h"
#import "Define.h"
#import "AppInfoModel.h"
#import "AppInfoTableViewCell.h"
#import "AppNiceTableViewCell.h"
#import <StoreKit/StoreKit.h>
#import "UIHelper.h"

#define CellSize2 CGSizeMake(ScreeSize.width, 200)

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SKStoreProductViewControllerDelegate>{
    UITableView *_appTableView;
    NSArray *_choiceDataArray;
}

@end

@implementation HomeViewController

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addNavItemBtns{
    //    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]
    //                                   initWithTitle:@"左边"
    //                                   style:UIBarButtonItemStyleBordered
    //                                   target:self
    //                                   action:@selector(clickLeftButton)];
    //        //创建一个右边按钮
    //    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
    //                                    initWithTitle:@"右边"
    //                                    style:UIBarButtonItemStyleDone
    //                                    target:self
    //                                    action:@selector(clickRightButton)];
    //    [self.navigationItem setLeftBarButtonItem:leftButton];
    //    [self.navigationItem setRightBarButtonItem:rightButton];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"首页"];
    [self initData];
    [self addTableView];
    
    NSInteger i = 10;
    NSLog(@"-----ff  %ld  %ld",i/3, i%3);
}
- (void)initData{
    _choiceDataArray = [[AppInfoModel getInstance] arrayAppInfoWithApptype:AppTypeMedicine];
    
}

- (void)addTableView{
    NSLog(@"ttff--- %@  %@",NSStringFromCGSize(ScreeSize),NSStringFromCGRect(self.view.frame));
    _appTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreeSize.width, ScreeSize.height) style:UITableViewStylePlain];
    _appTableView.delegate = self;
    _appTableView.dataSource = self;
    [self.view addSubview:_appTableView];
}

#pragma UITableViewDelegate的协议方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CellSize2.height;
    }
    return CellSize.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 25;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return NULL;
    }
    return NULL;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    if(indexPath.section == 1){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        AppInfo *info = [_choiceDataArray objectAtIndex:indexPath.row];
        [UIHelper openAppStoreWithAppId:info.appId withViewControler:self];
    }
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id992074342?mt=8"]];
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}

#pragma UITableViewDelegate的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return _choiceDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AppNiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appNiceCell"];
        if (!cell) {
            cell = [[AppNiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"appNiceCell" withSize:CellSize2];
            [cell addImage:[UIImage imageNamed:@"appInfo_bannner1.png"]];
            [cell addImage:[UIImage imageNamed:@"appInfo_bannner2.png"]];
            [cell addImage:[UIImage imageNamed:@"appInfo_bannner3.png"]];
        }
        return cell;
    }else{
        AppInfo *appInfo = _choiceDataArray[indexPath.row];
        AppInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appInfoCell"];
        if (!cell) {
            cell = [[AppInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"appInfoCell" withSize:CellSize];
            [cell setAppInfo:appInfo];
        }
        return cell;
    }
    return NULL;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"精品推荐";
    }
    return NULL;
}


@end







