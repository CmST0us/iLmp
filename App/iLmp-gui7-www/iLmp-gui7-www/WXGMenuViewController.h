//
//  WXGMenuViewController.h
//  SlideMenu
//
//  Created by Nicholas Chow on 15/7/5.
//  Copyright (c) 2015年 Nicholas Chow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXGMenuViewController : UITableViewController

// 注册菜单点击事件，第一次选中时不做动画
@property (nonatomic, copy) void(^menuDidClick)(UIViewController *item, BOOL first);

@end
