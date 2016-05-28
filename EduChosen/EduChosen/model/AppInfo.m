//
//  AppInfo.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

- (id)init{
    if (self = [super init]) {
        self.appName = @"";
        self.appIconUrl = @"";
        self.appPrice = 0.0f;
        self.appSize = 0.0f;
        self.appStarNum = 1;
        self.appType = AppTypeNone;
    }
    return self;
}

@end
