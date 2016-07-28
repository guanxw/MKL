//
//  HomeHeaderView.m
//  MakerOnly
//
//  Created by Jared on 16/7/18.
//  Copyright © 2016年 Jared. All rights reserved.
//

#import "HomeHeaderView.h"

#define ImageCount 3

@interface HomeHeaderView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HomeHeaderView

#pragma mark - 初始化View
- (void)initViews{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    self.headerScrollView.contentSize = CGSizeMake(ImageCount *self.frame.size.width, 0);
    self.headerScrollView.delegate = self;
    self.headerScrollView.pagingEnabled = YES;
    self.headerScrollView.bounces = NO;
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = 160;
    CGFloat imageY = 0;
    for (int i=0; i<ImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageX = i *imageW;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [self.headerScrollView addSubview:imageView];
    }
    self.headerScrollView.showsHorizontalScrollIndicator = NO;
    self.headerPageControl.numberOfPages = ImageCount;
    self.headerPageControl.enabled = NO;
    [self addTimer];
}

#pragma mark - scrollView的offset改变时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat X = scrollView.contentOffset.x;
    CGFloat scrollViewW = self.frame.size.width;
    int page = (scrollViewW/2 + X)/scrollViewW;
    self.headerPageControl.currentPage = page;
    
}

#pragma mark - scrollView开始拖拽时调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

#pragma mark - scrollView停止拖拽时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}
#pragma mark -  开启定时器
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
#pragma mark - nextImage自动跳转图片
- (void)nextImage{
    int page = (int)self.headerPageControl.currentPage;
    if (page == 2) {
        page =0;
    }else{
        page++;
    }
    CGFloat X = page * self.frame.size.width;
    self.headerScrollView.contentOffset = CGPointMake(X, 0);
}

#pragma mark - 关闭定时器
- (void)removeTimer{
    [self.timer invalidate];
}

@end
