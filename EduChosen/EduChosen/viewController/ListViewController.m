//
//  ListViewController.m
//  EduChosen
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "ListViewController.h"
#import "Define.h"
#import "UIHelper.h"
#import "AppInfoModel.h"
#import "AppTypeModel.h"
#import "AppInfoTableViewCell.h"
#import <StoreKit/StoreKit.h>

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource,SKStoreProductViewControllerDelegate>{
    UITableView *_appTableView;
    AppType _appType;
    NSArray *_dataArray;
}

@end

@implementation ListViewController

- (id)initWithAppType:(AppType)type{
    if (self = [super init]) {
        _appType = type;
        _dataArray = [[AppInfoModel getInstance] arrayAppInfoWithApptype:_appType];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *typeName = [[AppTypeModel getInstance] typeNameWithType:_appType];
    [self.navigationItem setTitle:typeName];
    self.navigationItem.backBarButtonItem.style = UIBarButtonItemStyleDone;
    [self addTableView];
}

- (void)addTableView{
    _appTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreeSize.width, ScreeSize.height) style:UITableViewStylePlain];
    _appTableView.delegate = self;
    _appTableView.dataSource = self;
    [self.view addSubview:_appTableView];
}

- (void)backClick:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma UITableViewDelegate的协议方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellSize.height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    
    AppInfo *info = [_dataArray objectAtIndex:indexPath.row];
    [UIHelper openAppStoreWithAppId:info.appId withViewControler:self];
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}

#pragma UITableViewDelegate的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppInfo *appInfo = _dataArray[indexPath.row];
    
    AppInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appInfoCell"];
    if (!cell) {
        cell = [[AppInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"appInfoCell" withSize:CellSize];
        [cell setAppInfo:appInfo];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma SKStoreProductViewControllerDelegate 协议函数
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
