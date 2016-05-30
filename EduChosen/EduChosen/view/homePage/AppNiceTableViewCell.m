//
//  AppNiceTableViewCell.m
//  EduChosen
//
//  Created by mac on 16/5/28.
//  Copyright © 2016年 李 树明. All rights reserved.
//

#import "AppNiceTableViewCell.h"

@interface AppNiceTableViewCell () <UIScrollViewDelegate> {
    CGSize _selfSize;
    NSMutableArray *_imgViewArray;
    NSInteger _curSelectIndex;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@end

@implementation AppNiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSize:(CGSize)size{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _selfSize = size;
        _imgViewArray = [[NSMutableArray alloc] init];
        _curSelectIndex = 0;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, size.width,size.height)];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceHorizontal = YES;
        //设置scrollview的属性
        _scrollView.contentSize = CGSizeMake(size.width*3,size.height);//计算ScroollView需要的大小
        _scrollView.showsHorizontalScrollIndicator=NO; //不显示水平滑动线
        _scrollView.showsVerticalScrollIndicator=NO;//不显示垂直滑动线
        _scrollView.pagingEnabled = YES;//scrollView不会停在页面之间，即只会显示第一页或者第二页，不会各一半显示
        [self.contentView addSubview:_scrollView];
        
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        CGSize psize = CGSizeMake(100, 20);
        pageControl.frame = CGRectMake((self.contentView.frame.size.width-psize.width)/2.0f, _selfSize.height-40, psize.width, psize.height);
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
//        pageControl.bounds = CGRectMake(0, 0, 200, 50);
//        pageControl.center = CGPointMake(size.width * 0.5, size.height - 20);
        
        pageControl.numberOfPages = 3 ; //设置页数为2
        pageControl.currentPage = 0; //初始页码为 0
        pageControl.userInteractionEnabled = NO; //pagecontroller不响应点击操作
        [self.contentView addSubview:pageControl];
        _pageControl = pageControl;
    }
    return self;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView == _scrollView){
        CGPoint offset = _scrollView.contentOffset;
        NSLog(@"offsetoffset ---- %lf",offset.x);
        _pageControl.currentPage = offset.x / (_selfSize.width); //计算当前的页码
        [_scrollView setContentOffset:CGPointMake(_selfSize.width * (_pageControl.currentPage),               _scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
    }
}

- (void)addImage:(UIImage *)image{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    CGFloat offsetx = _imgViewArray.count * _selfSize.width;
    CGRect frame = CGRectMake(offsetx, 0.0f, _selfSize.width, _selfSize.height);
    [imgView setFrame:frame];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    imgView.userInteractionEnabled = YES;
    [imgView addGestureRecognizer:tap];
    [_scrollView addSubview:imgView];
    [_imgViewArray addObject:imgView];
    
    imgView.tag = _imgViewArray.count;
//    _pageControl.numberOfPages = _imgViewArray.count;
     _scrollView.contentSize = CGSizeMake(_selfSize.width*_imgViewArray.count,_selfSize.height);//计算ScroollView需要的大小
}

- (void)clickImage:(UITapGestureRecognizer *)tap{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
