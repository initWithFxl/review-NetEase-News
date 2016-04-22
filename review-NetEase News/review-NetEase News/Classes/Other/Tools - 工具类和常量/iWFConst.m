#import <UIKit/UIKit.h>

// 网易新闻域名
NSString * const kNetEaseDomain = @"http://c.m.163.com/nc/article/headline/";

// 通知
// 左边菜单视图按钮被选中的通知
NSString *const HMLeftDockMenuDidSelectNotification = @"HMLeftDockMenuDidSelectNotification";
// 通过这个key可以取出左边菜单视图中被选中按钮的索引
NSString *const HMSelectedLeftDockMenuIndexKey = @"HMSelectedLeftDockMenuIndexKey";