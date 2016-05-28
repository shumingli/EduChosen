//
//  AppInfoModel.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppInfoModel.h"

@interface AppInfoModel(){
    NSMutableDictionary *_appInfoDic;
}

@end

@implementation AppInfoModel

static AppInfoModel *model = nil;

+ (AppInfoModel *)getInstance{
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch, ^{
        if (model == nil) {
            model = [[AppInfoModel alloc] init];
        }
    });
    return model;
}

- (void)dealloc{
    [_appInfoDic removeAllObjects];
    _appInfoDic = NULL;
}

- (id)init{
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (void)initData{
    _appInfoDic = [[NSMutableDictionary alloc] init];
    for (NSInteger i = AppTypeNone + 1; i< AppTypeMax; i++) {
        NSString *key = [self getKeyByAppType:i];
        NSMutableArray *value = [[NSMutableArray alloc] init];
        [_appInfoDic setObject:value forKey:key];
    }

    for (int i=0; i<20; i++) {
        AppInfo *info = [[AppInfo alloc] init];
        info.appName = @"海豹活动";
        info.appIconUrl = @"";
        info.appType = AppTypeMedicine;

        [[_appInfoDic objectForKey:[self getKeyByAppType:AppTypeMedicine]] addObject:info];
    }
}

- (NSString *)getKeyByAppType:(AppType)type{
    return [NSString stringWithFormat:@"type%ld",type];
}

- (NSArray<AppInfo *> *)arrayAppInfoWithApptype:(AppType)type{
    NSString *key = [self getKeyByAppType:type];
    NSArray *array = [_appInfoDic objectForKey:key];
    return array;
}






@end
