//
//  iWFBottomTabBar.h
//  review-NetEase News
//
//  Created by 张鸿懿 on 16/4/23.
//  Copyright © 2016年 initWithFxl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class iWFBottomTabBar;
// 设置协议 - 将自定义内部被点击的按钮索引传给tabBarController.进行切换控制器
@protocol iWFBottomTabBarDelegate <NSObject>

@optional
// 代理步骤一 : 定义协议方法
- (void)bottomTabBar:(iWFBottomTabBar *)tabBar didClickButtonTabBarWithIndex:(int)index;

@end

@interface iWFBottomTabBar : UIView
/** 通过传入两张照片,添加底部bottomBarBtn的方法 */
- (void)addButtonBarButtonWithImage:(NSString *)normal selected:(NSString *)selected;

/** 代理步骤二 - 设置代理属性 */
@property (nonatomic, weak) id<iWFBottomTabBarDelegate> delegate;
@end
