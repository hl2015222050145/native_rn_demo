//
//  HLRnRouterManager.m
//  native_rn_demo
//
//  Created by huanglin on 2022/6/24.
//

#import "HLRnRouterManager.h"
#import <React/RCTRootView.h>
#import "NavigationManager.h"

@implementation HLRnRouterManager
+(id)shareInstance
{
    static HLRnRouterManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
 }

- (instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}

- (RCTRootView *)createRNViewWithModuleName:(NSString *)moduleName prop:(NSDictionary *)prop
{
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    RCTRootView *rootView =
      [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                  moduleName: moduleName
                           initialProperties:prop
                               launchOptions: nil];
    return rootView;
}

- (void)openRNWithModuleName:(NSString *)moduleName prop:(NSDictionary *)prop
{
    RCTRootView *rootView = [self createRNViewWithModuleName:moduleName prop:prop];
    if(rootView){
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view = rootView;
        [[[NavigationManager shareInstance] currentNavgationController] pushViewController:vc animated:YES];
    }
    
}
@end
