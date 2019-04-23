//
//  WXGMenuCell.h
//  SlideMenu
//
//  Created by Nicholas Chow on 15/7/5.
//  Copyright (c) 2015年 Nicholas Chow. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WXGMenuCell : UITableViewCell
@property(nonatomic , strong)UIViewController *viewController;
@property (weak, nonatomic) IBOutlet UIImageView *menuIcon;
@end
