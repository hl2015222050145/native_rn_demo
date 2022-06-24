//
//  HLRnRouterManager.h
//  native_rn_demo
//
//  Created by huanglin on 2022/6/24.
//

#import <Foundation/Foundation.h>

@class RCTRootView;

@interface HLRnRouterManager : NSObject

+(id)shareInstance;

/**
 描述：创建RN容器
 参数：
    moduleName ： 模块名称
    prop ： 自定义参数
 返回值：RN容器
 */
- (RCTRootView *)createRNViewWithModuleName:(NSString *)moduleName prop:(NSDictionary *)prop;

/**
 描述：打开RN页面
 参数：
    moduleName ： 模块名称
    prop ： 自定义参数
 返回值：void
 */
- (void)openRNWithModuleName:(NSString *)moduleName prop:(NSDictionary *)prop;
@end

