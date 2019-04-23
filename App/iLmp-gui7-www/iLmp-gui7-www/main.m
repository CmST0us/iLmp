//
//  main.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 14-7-27.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ILAppDelegate.h"
#import "ILSystemController.h"
int main(int argc, char * argv[])
{
    
    @autoreleasepool {

        BOOL isRemove = NO;
        int opt;
        
        while ((opt = getopt(argc, argv, "r")) != -1) {
            switch (opt) {
                case 'r':
                    isRemove = YES;
                    break;
                default:
                    break;
            }
        }
        
        if (isRemove) {
            [ILSystemController changAndRefreshProxyWithHTTP:0 HTTPS:0];
            return 0;
        }
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([ILAppDelegate class]));
    
    
    
    }
}
