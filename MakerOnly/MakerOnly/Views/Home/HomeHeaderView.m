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
    
//    [self initSearchView];
}
//- (void)initSearchView{
//    UISearchBar *search = [[UISearchBar alloc] init];
//    [self addSubview:search];
//        [search mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).offset(30);
//            make.right.equalTo(self.mas_right).offset(-30);
//            make.top.equalTo(self.mas_top).offset(20);
//            make.height.equalTo(@30);
//        }];
//    
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat X = scrollView.contentOffset.x;
    CGFloat scrollViewW = self.frame.size.width;
    int page = (scrollViewW/2 + X)/scrollViewW;
    self.headerPageControl.currentPage = page;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}
// 开启定时器
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

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

// 关闭定时器
- (void)removeTimer{
    [self.timer invalidate];
}

@end
