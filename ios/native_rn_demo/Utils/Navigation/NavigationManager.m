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
    UIWindow *windows = nil;
    if (@available(iOS 15, *)) {
           __block UIScene * _Nonnull tmpSc;
            [[[UIApplication sharedApplication] connectedScenes] enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
                if (obj.activationState == UISceneActivationStateForegroundActive) {
                    tmpSc = obj;
                    *stop = YES;
                }
            }];
            UIWindowScene *curWinSc = (UIWindowScene *)tmpSc;
            windows = curWinSc.keyWindow;
        } else {
            windows = [UIApplication sharedApplication].windows.firstObject;
        }

    if (![windows isKindOfClass:[UIWindow class]]) {
        NSLog(@"未获取到导航控制器");
        return nil;
    }
    
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
