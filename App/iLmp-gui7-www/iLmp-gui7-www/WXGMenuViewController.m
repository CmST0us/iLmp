//
//  WXGMenuViewController.m
//  SlideMenu
//
//  Created by Nicholas Chow on 15/7/5.
//  Copyright (c) 2015年 Nicholas Chow. All rights reserved.
//

#import "WXGMenuViewController.h"
#import "WXGMenuCell.h"
#import "ILDefine.h"
@interface UIColor (ILColor)
+(UIColor*)ILRedColor;
+(UIColor*)ILGeryColor;
+(UIColor*)ILBlueColor;
@end
@implementation UIColor (ILColor)
+(UIColor*)ILRedColor{
    UIColor * t = [[UIColor alloc]initWithRed:kILredColor_r / 255.0 green:kILredColor_g / 255.0 blue:kILredColor_b / 255.0 alpha:1];
    return t;
}
+(UIColor*)ILGeryColor{
    UIColor *t = [[UIColor alloc]initWithRed:kILgeryColor_r / 255.0 green:kILgeryColor_g / 255.0 blue:kILgeryColor_b / 255.0 alpha:1];
    return t;
}
+(UIColor*)ILBlueColor{
    UIColor *t =[[UIColor alloc]initWithRed:kILblueColor_r / 255.0 green:kILblueColor_g / 255.0 blue:kILblueColor_b / 255.0 alpha:1];
    return t;
}
@end
@interface WXGMenuViewController ()

@property (nonatomic, copy) UIViewController *choosedViewController;

@end

@implementation WXGMenuViewController

// 加载plist文件数据并转换为模型数组

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 默认选中菜单第一行，第一次选中时不做动画
    self.menuDidClick([[UIStoryboard storyboardWithName:kILMainStoryBoardFileName bundle:nil] instantiateViewControllerWithIdentifier:kILMainViewStoryBoardID], YES);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kILNumberOfAllViewController;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // NSString * identifier = [[NSString alloc]initWithFormat:@"%@%ld",[WXGMenuCell class],(long)indexPath.row];
    WXGMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXGMenuCell class])];
    //cell.item = self.menuItems[indexPath.row];
    //Add cell.viewController this to changeviewcontroller
    switch ((indexPath.row)%3) {
        case 0:{
            cell.backgroundColor = [UIColor ILRedColor];
        }
            break;
        case 1:{
            cell.backgroundColor = [UIColor ILBlueColor];
        }
            break;
        case 2:{
            cell.backgroundColor = [UIColor ILGeryColor];
        }
            break;
        default:
            break;
    }
    UIStoryboard * currentStoryBoard =[UIStoryboard storyboardWithName:kILMainStoryBoardFileName bundle:nil];
    switch (indexPath.row) {
        case kILMainViewIndex:{
            cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILMainViewStoryBoardID];
        }
            break;
        case kILNetSettingViewIndex:{
            cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILNetSettingViewStoryBoardID];

        }
            break;
        case kILNginxSettingViewIndex:{
             cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILNginxSettingViewStoryBoardID];
        }
            break;
        case kILPhpSettingViewIndex:{
            cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILPhpSettingViewStoryBoardID];
            
        }
            
            break;
        case kILHaproxySettingViewIndex:{
            cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILHaproxySettingViewStoryBoardID];
        }
            break;
      //  case kILPfctlSettingViewIndex:{
      //      cell.viewController = [currentStoryBoard instantiateViewControllerWithIdentifier:kILPfctlSettingViewStoryBoardID];
       // }
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.tableView.bounds.size.height) / 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!((WXGMenuCell*)[tableView cellForRowAtIndexPath:indexPath]).viewController) {
        return;
    }
    if (self.menuDidClick) {
        self.menuDidClick(((WXGMenuCell*)[tableView cellForRowAtIndexPath:indexPath]).viewController, NO);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
