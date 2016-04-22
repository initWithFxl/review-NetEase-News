//
//  iWFBottomTabBar.m
//  review-NetEase News
//
//  Created by 张鸿懿 on 16/4/23.
//  Copyright © 2016年 initWithFxl. All rights reserved.
//

#import "iWFBottomTabBar.h"
#import "iWFBottomTabBarBtn.h"
@interface iWFBottomTabBar()

// 记录当前被选中的tabBarBtn
@property (nonatomic, weak) UIButton *selectedBtn;

@end
@implementation iWFBottomTabBar

- (void)addButtonBarButtonWithImage:(NSString *)normal selected:(NSString *)selected
{
    // 1. 创建一个按钮
    iWFBottomTabBarBtn *btn = [[iWFBottomTabBarBtn alloc] init];
    
    // 2. 设置按钮的背景图片
    [btn setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    
    // 3. 把按钮添加到底部的bottomTabBar中
    [self addSubview:btn];
    
    // 4. 为按钮绑定一个时间
    [btn addTarget:self action:@selector(didClickTabBarButton:) forControlEvents:UIControlEventTouchDown];
}

/** 按钮点击事件*/
- (void)didClickTabBarButton:(UIButton *)button
{
    // 1.取消当前按钮的选中状态
    self.selectedBtn.selected = NO;
    
    // 2.设置传进来的按钮为选中状态
    button.selected = YES;
    
    // 3.记录传进来的按钮为当前选中按钮
    self.selectedBtn = button;
    
    // 4.获取当前被点击按钮的索引,调用代理方法,让tbaBarController切换当前显示的子控制器
    int index = (int)button.tag;
    // 代理步骤三 : 判断是否实现了协议中的方法,如果实现了,就调用
    if ([self.delegate respondsToSelector:@selector(bottomTabBar:didClickButtonTabBarWithIndex:)]) {
        [self.delegate bottomTabBar:self didClickButtonTabBarWithIndex:index];
    }
}

#pragma mark  布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 获取总按钮数量
    NSUInteger count = self.subviews.count;
    
    // 设置frame
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    CGFloat y = 0;
    for (int i = 0;i < count; i++) {
        CGFloat x = i * w;
        // 获取对应的按钮,设置frame
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(x, y, w, h);
        
        // 为每一个button绑定一个tag值
        button.tag = i;
        
        // 设置默认按钮为第0个
        if (i == 0) {
            button.selected = YES;
            self.selectedBtn = button;
        }
    }
}


@end
