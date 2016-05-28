//
//  AppInfoModel.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppInfo.h"

@interface AppInfoModel : NSObject{

}
+ (AppInfoModel *)getInstance;
/**
 *  获取某个分类下的所有app
 *  @pars  app类型
 *  @return  array
 */
- (NSArray<AppInfo *> *)arrayAppInfoWithApptype:(AppType)type;

@end
