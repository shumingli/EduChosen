//
//  Define.h
//  EduChosen
//
//  Created by 李 树明 on 16/5/21.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#ifndef Define_h
#define Define_h

/*
 des:屏幕大小
 */
#define ScreeSize [[UIScreen mainScreen] bounds].size
#define CellSize CGSizeMake(ScreeSize.width, 100)

typedef NS_ENUM(NSInteger, AppType) {
    AppTypeNone,
    AppTypeMedicine, //医学
    AppTypeAccount, //会计
    AppTypeMedicine1, //医学
    AppTypeAccount2, //会计
    AppTypeMedicine3, //医学
    AppTypeAccount4, //会计

    AppTypeMax,
};


#endif /* Define_h */
