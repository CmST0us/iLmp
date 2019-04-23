//
//  ILSlideViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/22.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//
#import "ILSlideViewController.h"
#import "ILSlideTableViewController.h"
#import "WXGContainerViewController.h"
#import "ILDefine.h"
#import "ILMainViewController.h"
@interface ILSlideTableViewController ()
@property (nonatomic, weak) UIImageView *hamburger;
@end

@implementation ILSlideTableViewController
@synthesize hamburgerDelegate =_hamburgerDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // UIBarButtonItem的initWithCustomView:方法会对内部控件有特殊约束
    // 直接将hamburger添加上去会无法实现滚动效果
    // 解决办法：将hamburger包装在一个view里面
    UIView *wrapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hamburgerClick)];
    [wrapView addGestureRecognizer:tap];
    
    UIImageView *hamburger = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hamburger"]];
    self.hamburger = hamburger;
    
    [wrapView addSubview:hamburger];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:wrapView];
    

}

// 顶部hamburger按钮点击事件
- (void)hamburgerClick {
    [self.hamburgerDelegate hamburgerInViewControllerDidClick:self];
}

// 顶部hamburger按钮滚动效果
- (void)rotateHamburgerWithScale:(CGFloat)scale {
    CGFloat angle = M_PI_2 * (1 - scale);
    self.hamburger.transform = CGAffineTransformMakeRotation(angle);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)setDelegate:(id)adelegate{
    self.hamburgerDelegate = adelegate;
    return self;
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ILSlideTableViewController * slid = [segue destinationViewController];
    if ([[segue sourceViewController] isKindOfClass:[ILSlideViewController class]]) {
        [slid setHamburgerDelegate:((ILSlideViewController*)[segue sourceViewController]).hamburgerDelegate];
    }else{
    [slid setHamburgerDelegate:((ILSlideTableViewController*)[segue sourceViewController]).hamburgerDelegate];
    }
}


@end
