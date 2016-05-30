//
//  AppInfoTableViewCell.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppInfo;
@interface AppInfoTableViewCell : UITableViewCell{

}
@property (nonatomic,strong,readonly) UIImageView *appIcon;
@property (nonatomic,strong,readonly) UILabel *appNameLabel;
@property (nonatomic,strong,readonly) UILabel *appDownLoadLabel;
@property (nonatomic,strong,readonly) UILabel *appSizeLabel;
@property (nonatomic,strong,readonly) UIButton *gotoAppInfoBtn;

- (void)setAppStars:(NSInteger)stars;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSize:(CGSize)size;

- (void)setAppInfo:(AppInfo *)appInfo;

@end
