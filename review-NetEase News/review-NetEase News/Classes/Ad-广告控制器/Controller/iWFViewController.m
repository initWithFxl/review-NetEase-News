//
//  iWFViewController.m
//  review-NetEase News
//
//  Created by 张鸿懿 on 16/4/23.
//  Copyright © 2016年 initWithFxl. All rights reserved.
//

#import "iWFViewController.h"
#import "iWFMainTabBarController.h"
@interface iWFViewController ()

@end

@implementation iWFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 设置启动图片
    UIImageView *backgrounImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    [self.view addSubview:backgrounImgView];
    backgrounImgView.frame = self.view.bounds;
    
    // 设置广告图片
    UIImageView *adImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad"]];
    [self.view addSubview:adImgView];
    adImgView.width = 306;
    adImgView.height = 310;
    adImgView.centerX = self.view.width * 0.5;
    adImgView.centerY = self.view.height * 0.4;
    
    // 广告之后获取主窗口,跳转到mainTabBarVc
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 获取主窗口
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        // 创建UITabBarController
        iWFMainTabBarController *mainTabBarVc = [[iWFMainTabBarController alloc] init];
        
        // 设置UIWindow的根控制器为mainTabBarVc
        window.rootViewController = mainTabBarVc;
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
