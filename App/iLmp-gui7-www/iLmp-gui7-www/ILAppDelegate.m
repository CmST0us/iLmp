//
//  ILAppDelegate.m
//  iLmp-gui7
//
//  Created by CmST0us on 14-4-6.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//

#import "ILAppDelegate.h"
#import "ILDefine.h"
#import "ILSystemController.h"
@implementation ILAppDelegate
@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    setuid(0);
    setgid(0);

    
    //后台套接字通信!!
    //
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSDictionary * t_profile = [[NSDictionary alloc]initWithContentsOfFile:kILProfilePath];
    if (!t_profile) {
        NSDictionary * profile = [[NSDictionary alloc]initWithObjectsAndKeys:kILUnionDictionaryValue,kILCarrierDictionaryKey,@"",kILKeyDictionaryKey, nil];
        [profile writeToFile:kILProfilePath atomically:YES];
    }
    
    //权限更改
    [ILSystemController chmodAndchownTheWWW];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    setuid(0);
    setgid(0);
    exit(0);
    
}

@end
