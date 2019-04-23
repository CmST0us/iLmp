//
//  ILAppDelegate.h
//  iLmp-gui7
//
//  Created by CmST0us on 14-4-6.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILMainViewController.h"
@class ILMainViewController;
@interface ILAppDelegate : UIResponder <UIApplicationDelegate>{
    //UINavigationController *mainNav;
    ILMainViewController *mainViewController;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong,nonatomic)   UINavigationController *mainNav;
@property (strong,nonatomic)    ILMainViewController *mainViewController;
@end
