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

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_appTableView;
    NSArray *_choiceDataArray;
}

@end

@implementation HomeViewController

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
}
- (void)initData{
    _choiceDataArray = [NSArray arrayWithObjects:@"", nil];
}

- (void)addTableView{
    _appTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreeSize.width, ScreeSize.height) style:UITableViewStylePlain];
    _appTableView.delegate = self;
    _appTableView.dataSource = self;
    [self.view addSubview:_appTableView];
}

#pragma UITableViewDelegate的协议方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    return 68;
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

#pragma UITableViewDelegate的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    NSArray *array = [[AppInfoModel getInstance] arrayAppInfoWithApptype:AppTypeMedicine];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = NULL;
//    if (indexPath.section == 0) {
//
//    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"appInfoCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"appInfoCell"];
            cell.textLabel.text = @"tttttteeee";
//            cell.detailTextLabel.text = @"sjfdjfksjfkdsfjdksfjdskfdskfsdkfjdskfjdksfjskdfjdksfjskfjdskfjdskfjdksfds";
            cell.imageView.image = [UIImage imageNamed:@"Icon.png"];
            cell.imageView.layer.cornerRadius = 10.0f;
        }
//    }
    return cell;
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







