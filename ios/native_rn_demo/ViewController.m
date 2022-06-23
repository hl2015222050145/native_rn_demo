//
//  ViewController.m
//  native_rn_demo
//
//  Created by huanglin on 2022/6/22.
//

#import "ViewController.h"
#import <React/RCTRootView.h>


@interface ViewController ()
@property(nonatomic,strong)UIButton *jumpRnBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
    
    
}

- (void)setupSubviews
{
    [self.view addSubview:self.jumpRnBtn];
}


- (UIButton *)jumpRnBtn
{
    if(!_jumpRnBtn){
        _jumpRnBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
        [_jumpRnBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _jumpRnBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_jumpRnBtn addTarget:self action:@selector(jumpRnBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _jumpRnBtn.backgroundColor = [UIColor redColor];

    }
    return _jumpRnBtn;
}

- (void)jumpRnBtnClick
{
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    RCTRootView *rootView =
      [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                  moduleName: @"RNHighScores"
                           initialProperties:
                             @{
                               @"scores" : @[
                                 @{
                                   @"name" : @"Alex",
                                   @"value": @"42"
                                  },
                                 @{
                                   @"name" : @"Joel",
                                   @"value": @"100"
                                 }
                               ]
                             }
                               launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
