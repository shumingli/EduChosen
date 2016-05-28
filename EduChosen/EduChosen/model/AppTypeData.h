//
//  AppType.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface AppTypeData : NSObject{

}
/**
 *  app 类型
 */
@property (nonatomic,assign) AppType type;
/**
 *  app 类型名字
 */
@property (nonatomic,strong) NSString *name;
/**
 *    用类型与名字初始化
 *    @param type 类型
 *    @param name  类型名字
 *    @return 实例
 */
- (id)initWithType:(AppType)type withName:(NSString *)name;

@end
