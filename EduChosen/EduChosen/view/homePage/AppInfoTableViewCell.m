//
//  AppInfoTableViewCell.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppInfoTableViewCell.h"
#import "Define.h"
#import "AppInfo.h"

@interface AppInfoTableViewCell (){

}
@property (nonatomic,assign) CGSize selfSize;


@end

@implementation AppInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSize:(CGSize)size{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selfSize = size;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGSize iconSize = CGSizeMake(80, 80);
        _appIcon = [[UIImageView alloc] initWithFrame:CGRectMake(20,(self.selfSize.height-iconSize.width)/2.0 , iconSize.width, iconSize.height)];
        [self.contentView addSubview:_appIcon];
        self.appIcon.layer.cornerRadius = 10.0f;
        
        CGFloat appNameLabelOffsetx = _appIcon.frame.origin.x + _appIcon.frame.size.width + 10;
        _appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(appNameLabelOffsetx, 5 , ScreeSize.width - appNameLabelOffsetx - 80,25)];
        [self.contentView addSubview:_appNameLabel];
        
        CGSize downLoadSize = CGSizeMake(100, 15);
        _appDownLoadLabel = [[UILabel alloc] initWithFrame:CGRectMake(_appNameLabel.frame.origin.x, size.height-downLoadSize.height-5, downLoadSize.width,downLoadSize.height)];
        _appDownLoadLabel.backgroundColor = [UIColor clearColor];
        _appDownLoadLabel.textColor =  [UIColor grayColor];
        _appDownLoadLabel.textAlignment = NSTextAlignmentLeft;
        _appDownLoadLabel.font = [UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:_appDownLoadLabel];
        
        _appSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_appDownLoadLabel.frame.origin.x+_appDownLoadLabel.frame.size.width+10, _appDownLoadLabel.frame.origin.y, downLoadSize.width,downLoadSize.height)];
        _appSizeLabel.backgroundColor = [UIColor clearColor];
        _appSizeLabel.textColor =  [UIColor grayColor];
        _appSizeLabel.textAlignment = NSTextAlignmentLeft;
        _appSizeLabel.font = [UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:_appSizeLabel];
        
        CGSize btnSize = CGSizeMake(50, 30);
        _gotoAppInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _gotoAppInfoBtn.backgroundColor = [UIColor orangeColor];
        _gotoAppInfoBtn.layer.cornerRadius = 5; //self.frame.size.height
        _gotoAppInfoBtn.frame = CGRectMake(ScreeSize.width-btnSize.width-20,(self.selfSize.height - btnSize.height)/2 , btnSize.width, btnSize.height);
        [_gotoAppInfoBtn setTitle:@"免费" forState:UIControlStateNormal];
        [_gotoAppInfoBtn addTarget:self action:@selector(gotoAppInfoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _gotoAppInfoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _gotoAppInfoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_gotoAppInfoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_gotoAppInfoBtn];
    }
    return self;
}
- (void)setAppInfo:(AppInfo *)appInfo{
    _appIcon.image = [UIImage imageNamed:@"Icon.png"];
    _appNameLabel.text = appInfo.appName;
    _appDownLoadLabel.text = [NSString stringWithFormat:@"%ld次下载",appInfo.appDownLoadCount];
    _appSizeLabel.text = appInfo.appSizeStr;
    [self setAppStars:appInfo.appStarNum];

}

- (void)setAppStars:(NSInteger)stars{
    CGFloat offsetX = _appNameLabel.frame.origin.x;
    CGFloat offsetY = _appNameLabel.frame.origin.y + _appNameLabel.frame.size.height;
    for (int i=0; i<5; i++) {
        UIImageView *starImgView = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 22, 22)];
        [self.contentView addSubview:starImgView];
        if (i < stars) {
            starImgView.image = [UIImage imageNamed:@"appInfo_star1"];
        }else{
            starImgView.image = [UIImage imageNamed:@"appInfo_star2"];
        }
        offsetX = offsetX + starImgView.frame.size.width + 5;
    }
}

- (void)gotoAppInfoBtnClick:(UIButton *)sender{

}







@end
