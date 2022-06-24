//
//  NavigationManager.h
//  native_rn_demo
//
//  Created by huanglin on 2022/6/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationManager : NSObject

+(id)shareInstance;

- (UINavigationController *)currentNavgationController;

@end

