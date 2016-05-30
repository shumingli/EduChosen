//
//  AppInfo.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface AppInfo : NSObject{

}
/**
 *  appid
 */
@property (nonatomic,strong) NSString *appId;
/**
 *  app名字
 */
@property (nonatomic,strong) NSString *appName;
/**
 *  app 图标 url
 */
@property (nonatomic,strong) NSString *appIconUrl;
/**
 *  app 星级
 */
@property (nonatomic,assign) NSInteger appStarNum;
/**
 *  app 价格
 */
@property (nonatomic,assign) float appPrice;
/**
 *  app 大小
 */
@property (nonatomic,assign) double appSize;
/**
 *  app 大小
 */
@property (nonatomic,strong) NSString *appSizeStr;
/**
 *  app 类型
 */
@property (nonatomic,assign) AppType appType;
/**
 *  app 下载量
 */
@property (nonatomic,assign) NSInteger appDownLoadCount;


@end
