//
//  iWFMainTabBarController.m
//  review-NetEase News
//
//  Created by 张鸿懿 on 16/4/23.
//  Copyright © 2016年 initWithFxl. All rights reserved.
//

#import "iWFMainTabBarController.h"
#import "iWFNavigationController.h"
#import "iWFBottomTabBar.h"
@interface iWFMainTabBarController ()<iWFBottomTabBarDelegate>

@end

@implementation iWFMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化子控制器
    [self setupChildViewControllers];

    // 初始化自定义底部TabBar
    [self setupCustomTabBar];
}

#pragma mark  初始化子控制器
- (void)setupChildViewControllers
{
    // 加载5个storyboard文件中的导航控制器,并且把这些导航栏控制器添加到self中
    // 1.新闻中心
    iWFNavigationController *navMainHall     = [self navigationControllerWithStoryboardName:@"Main"];

    // 2.阅读中心
    iWFNavigationController *navReadingHall  = [self navigationControllerWithStoryboardName:@"Reading"];

    // 3.视听中心
    iWFNavigationController *navVedioHall    = [self navigationControllerWithStoryboardName:@"Video"];

    // 4.发现
    iWFNavigationController *navDiscoverHall = [self navigationControllerWithStoryboardName:@"Discover"];

    // 5.我
    iWFNavigationController *navMeHall       = [self navigationControllerWithStoryboardName:@"Me"];

    // 6.将上面5个控制器添加到iWFMainTabBarController控制器中
    self.viewControllers                     = @[navMainHall,navReadingHall,navDiscoverHall,navVedioHall,navMeHall];
    
}

// 封装一个根据storyboard文件名快速创建箭头指向的初始化控制器
- (iWFNavigationController *)navigationControllerWithStoryboardName:(NSString *)name
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    return [storyboard instantiateInitialViewController];
}

#pragma mark  初始化自定义底部TabBar
- (void)setupCustomTabBar
{
    // 1.创建自定义TabBar
    iWFBottomTabBar * tabBar = [[iWFBottomTabBar alloc] init];
    
    // 2.通过循环来创建若干个tabBarBtn
    NSUInteger count = self.viewControllers.count;
    for (int i = 0; i < count; i++) {
        // 获取普通图片和选中图片的名称
        NSString *normal = [NSString stringWithFormat:@"TabBar%d",(i + 1)];
        NSString *selected = [NSString stringWithFormat:@"TabBar%dSel",(i + 1)];
        // 调用内部封装的方法来快速创建自定义tabBar按钮
        [tabBar addButtonBarButtonWithImage:normal selected:selected];
    }
    
    // 3.设置frame并添加到系统的tabBar中去
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    
    // 设置代理
    tabBar.delegate = self;
}

#pragma mark -  <iWFButtomTabBarDelegate>
// 代理步骤六 - 实现协议方法
- (void)bottomTabBar:(iWFBottomTabBar *)tabBar didClickButtonTabBarWithIndex:(int)index
{
    // 让UITabBarController自己来切换需要显示的子控制器 selectedIndex是系统内部自己的属性
    self.selectedIndex = index;
    
}


@end
