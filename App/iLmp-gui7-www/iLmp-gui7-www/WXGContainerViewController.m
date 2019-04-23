//
//  WXGContainerViewController.m
//  SlideMenu
//
//  Created by Nicholas Chow on 15/7/5.
//  Copyright (c) 2015年 Nicholas Chow. All rights reserved.
//

#import "WXGContainerViewController.h"
#import "WXGMenuViewController.h"
#import "ILMainViewController.h"
#import "ILSlideTableViewController.h"
#import "ILDefine.h"
@interface WXGContainerViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *menuContainerView;

@property (nonatomic, weak) WXGMenuViewController *menuViewController;
@property (nonatomic, weak) UINavigationController *detailNavViewController;

@property (nonatomic, getter=isShowMenu) BOOL showMenu;

@end


@implementation WXGContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册菜单点击事件，第一次选中时不做动画
    self.menuViewController.menuDidClick = ^(UIViewController *item, BOOL first) {
        if ([item isKindOfClass:[ILSlideViewController class]]) {
            ((ILSlideViewController*)item).hamburgerDelegate = self;
        }else{
        
        
        ((ILSlideTableViewController*)item).hamburgerDelegate = self;
        }
        [self.detailNavViewController popToRootViewControllerAnimated:NO];
        [self.detailNavViewController pushViewController:item animated:NO];
        [item viewDidLoad];
       
        [self hideOrShowMenu:NO animated:!first];
    };
    
    self.menuContainerView.layer.anchorPoint = CGPointMake(1, 0.5);
}
//
#pragma Delegate
-(void)hamburgerInViewControllerDidClick:(UIViewController *)viewcontroller{
     [self hideOrShowMenu:!self.isShowMenu animated:YES];
}
//
#pragma Controller
// 控制菜单视图显示与隐藏
- (void)hideOrShowMenu:(BOOL)hideOrShow animated:(BOOL)animated {
    [self.scrollView setContentOffset:hideOrShow ? CGPointZero : CGPointMake(self.menuContainerView.bounds.size.width, 0) animated:animated];
    self.showMenu = hideOrShow;
}

// 监听视图滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scale = scrollView.contentOffset.x / CGRectGetWidth(self.menuContainerView.bounds);
    
    // 顶部hamburger按钮滚动效果
    if ([self.detailNavViewController.topViewController isKindOfClass:[ILSlideViewController class]]) {
        [(ILSlideViewController*)self.detailNavViewController.topViewController rotateHamburgerWithScale:scale];
    }else{
    [(ILSlideTableViewController*)self.detailNavViewController.topViewController rotateHamburgerWithScale:scale];
    }
    // 菜单视图翻页效果
    self.menuContainerView.layer.transform = [self transformWithScale:scale];
    self.menuContainerView.alpha = 1 - scale;
    
    // Fix for the UIScrollView paging-related issue
    // http://stackoverflow.com/questions/4480512/uiscrollview-single-tap-scrolls-it-to-top
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame));
}

// 菜单视图的翻页效果
- (CATransform3D)transformWithScale:(CGFloat)scale {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 1000.0;
    CGFloat angle = -M_PI_2 * scale;
    CATransform3D rotation = CATransform3DRotate(transform, angle, 0, 1, 0);
    CATransform3D translation = CATransform3DMakeTranslation(CGRectGetWidth(self.menuContainerView.bounds) *0.5, 0, 0);
    return CATransform3DConcat(rotation, translation);
}

// 获取两个子控制器
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MenuViewControllerSegue"]) {
        self.menuViewController = (WXGMenuViewController *)[segue.destinationViewController topViewController];
    } else if ([segue.identifier isEqualToString:@"MainViewNavControllerSegue"]) {
        self.detailNavViewController = (UINavigationController*)segue.destinationViewController;
    }
}

// 更改状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
