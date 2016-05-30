//
//  AppNiceTableViewCell.h
//  EduChosen
//
//  Created by mac on 16/5/28.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppNiceTableViewCell : UITableViewCell{

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSize:(CGSize)size;
- (void)addImage:(UIImage *)image;

@end
