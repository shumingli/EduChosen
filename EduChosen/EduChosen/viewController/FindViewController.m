//
//  FindViewController.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/21.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "FindViewController.h"
#import "Define.h"
#import "AppTypeModel.h"
#import "ListViewController.h"

@implementation FindViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"分类"];
    [self addUI];
}

- (void)addUI{
    CGSize labelSize = CGSizeMake(100, 30);

//    UILabel *title1Label = [[UILabel alloc] initWithFrame:CGRectMake(20, 64 + 20, labelSize.width,labelSize.height)];
////    title1Label.backgroundColor = [UIColor blackColor];
//    title1Label.textColor =  [UIColor grayColor];
//    title1Label.textAlignment = NSTextAlignmentLeft;
////    title1Label.font = [UIFont fontWithName:@"Arial" size:16];
//    title1Label.font = [UIFont boldSystemFontOfSize:16];
//    title1Label.text = @"最近搜索：";
//    [self.view addSubview:title1Label];

    UILabel *title2Label = [[UILabel alloc] initWithFrame:CGRectMake(20, 64 + 20, labelSize.width,labelSize.height)];
    title2Label.textColor =  [UIColor grayColor];
    title2Label.textAlignment = NSTextAlignmentLeft;
    title2Label.font = [UIFont boldSystemFontOfSize:16];
    title2Label.text = @"所有分类：";
    [self.view addSubview:title2Label];
    
    //医学
    NSArray *nameArray = [NSArray arrayWithObjects:@"yixue",@"kuaiji",@"yixue",@"yixue",@"kuaiji",@"yixue", nil];
    NSArray *titleArray = [AppTypeModel getInstance].typesArray;
    
    CGFloat offsetx = 20;
    CGFloat offsety = title2Label.frame.origin.y + title2Label.frame.size.height + 10;
    for (int i = 0;i < nameArray.count;i++) {
        NSString *name = nameArray[i];
        NSString *imgName = [NSString stringWithFormat:@"fenlei_%@",name];
        UIImage *norImage = [UIImage imageNamed:imgName];
        UIImage *selImage = [UIImage imageNamed:imgName];
        offsety = title2Label.frame.origin.y + title2Label.frame.size.height + 10 + (norImage.size.height+25)*(i/3);

        CGFloat space = (ScreeSize.width - norImage.size.width *3)/4;
        offsetx = (space + norImage.size.width)*(i%3) + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(offsetx,offsety, norImage.size.width, norImage.size.height);
        [btn setImage:norImage forState:UIControlStateNormal];
        [btn setImage:selImage forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        AppTypeData *apptypeData = titleArray[i];
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(offsetx, offsety+norImage.size.height, norImage.size.width,20)];
        nameLabel.textColor =  [UIColor grayColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont boldSystemFontOfSize:12];
        nameLabel.text = apptypeData.name;
        [self.view addSubview:nameLabel];
    }
}

- (void)categoryBtnClick:(UIButton *)sender{
    ListViewController *listVC = [[ListViewController alloc] initWithAppType:AppTypeMedicine];
    [self.navigationController pushViewController:listVC animated:YES];
    

}

@end
