//
//  AppType.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppTypeData.h"

@implementation AppTypeData

- (id)init{
    if (self = [super init]) {
        self.type = 0;
        self.name = @"";
    }
    return self;
}

- (id)initWithType:(AppType)type withName:(NSString *)name{
    if (self = [super init]) {
        self.type = type;
        self.name = name;
    }
    return self;
}

@end
