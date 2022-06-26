//
//  NavigationManager.m
//  native_rn_demo
//
//  Created by huanglin on 2022/6/24.
//

#import "NavigationManager.h"
#import <UIKit/UIKit.h>

@interface NavigationManager ()

@property (weak, nonatomic) UIWindow *window;

@end

@implementation NavigationManager
+(id)shareInstance
{
    static NavigationManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
 }


- (UINavigationController *)currentNavgationController
{
    UIWindow *windows = UIApplication.sharedApplication.delegate.window;
    UIViewController *rootViewController = windows.rootViewController;
    return [self getCurrentNavigationFrom:rootViewController];
}

- (UINavigationController *)getCurrentNavigationFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UINavigationController *nc = ((UITabBarController *)vc).selectedViewController;
        return [self getCurrentNavigationFrom:nc];
    }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        if (((UINavigationController *)vc).presentedViewController) {
            return [self getCurrentNavigationFrom:((UINavigationController *)vc).presentedViewController];
        }
        return [self getCurrentNavigationFrom:((UINavigationController *)vc).topViewController];
    }
    else if ([vc isKindOfClass:[UIViewController class]]) {
        if (vc.presentedViewController) {
            return [self getCurrentNavigationFrom:vc.presentedViewController];
        }
        else {
            return vc.navigationController;
        }
    }
    else {
        NSLog(@"未获取到导航控制器");
        return nil;
    }
}
@end
