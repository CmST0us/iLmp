//
//  ILSlideViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/28.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILSlideTableViewController.h"

@interface ILSlideViewController : UIViewController

// 注册顶部hamburger按钮点击事件
@property (nonatomic, copy) void(^hamburgerDidClick)();
@property (nonatomic , strong)id<ILSlideHamburgerDidClick> hamburgerDelegate;

// 顶部hamburger按钮滚动效果
- (void)rotateHamburgerWithScale:(CGFloat)scale;
-(id)setDelegate:(id)adelegate;
@end
