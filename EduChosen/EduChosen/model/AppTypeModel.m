//
//  AppTypeModel.m
//  EduChosen
//
//  Created by 李 树明 on 16/5/22.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppTypeModel.h"

@interface AppTypeModel() {

}
@end

@implementation AppTypeModel

static AppTypeModel *model = nil;

+ (AppTypeModel *)getInstance{
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch, ^{
        if (model == nil) {
            model = [[AppTypeModel alloc] init];
        }
    });
    return model;
}

- (id)init{
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (void)initData{
    NSMutableArray *typesArray = [NSMutableArray array];
    for (int i= AppTypeNone+1; i< AppTypeMax; i++) {
        AppTypeData *typeData = [[AppTypeData alloc] initWithType:i withName:[self typeNameWithType:i]];
        [typesArray addObject:typeData];
    }
    _typesArray = [[NSArray alloc] initWithArray:typesArray];
}

- (NSString *)typeNameWithType:(AppType)type{
    NSString *typeName = @"";
    switch (type) {
        case AppTypeMedicine:
            typeName = @"医学";
            break;
        case AppTypeAccount:
            typeName = @"会计";
            break;
        default:
            break;
    }
    return typeName;
}







@end
