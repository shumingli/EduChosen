//
//  AppInfoTableViewCell.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInfoTableViewCell : UITableViewCell{

}

@property (nonatomic,strong,readonly) UILabel *appNameLabel;
@property (nonatomic,strong,readonly) UILabel *appSizeLabel;
@property (nonatomic,strong,readonly) UIButton *gotoAppBtn;

@end
