//
//  AppTypeModel.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppTypeData.h"

@interface AppTypeModel : NSObject{

}
/**
 *  获取App所有分类
 *  @return 获取唯一实例
 */
+ (AppTypeModel *)getInstance;
/**
 *  获取App所有分类
 */
@property (nonatomic,strong,readonly) NSArray<AppTypeData *> *typesArray;

@end
