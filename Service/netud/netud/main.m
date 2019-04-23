//
//  main.m
//  netud
//
//  Created by CmST0us on 14-7-28.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+AES256.h"
#import "UIDevice+MobileGestaltCategory.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#import "ILSystemController.h"
#import "ILProfileFileController.h"
#import "ILPreferenceFileController.h"
#import "ILDefine.h"
int main (int argc, const char * argv[])
{
    @try {
        [ILSystemController chmodAndchownTheWWW];
        //先打开后台
        ILProfileFileController * profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
        switch ([profileController getStartMethod]) {
            case ILHTTPProxyOnly:{
                [ILSystemController changeAndRefreshProxyWithHTTP:1 HTTPProxy:[[profileController profileDict]objectForKey:kILHTTPProxyDictionaryKey] HTTPPort:[[profileController profileDict] objectForKey:kILHTTPPortDictionaryKey]  WithHTTPS:0 HTTPSProxy:[[profileController profileDict]objectForKey:kILHTTPSProxyDictionaryKey] HTTPSPort:[[profileController profileDict] objectForKey:kILHTTPSPortDictionaryKey]];
            }
                break;
            case ILHTTPProxyAndBGMethod:{
                [ILSystemController changeAndRefreshProxyWithHTTP:1 HTTPProxy:[[profileController profileDict]objectForKey:kILHTTPProxyDictionaryKey] HTTPPort:[[profileController profileDict] objectForKey:kILHTTPPortDictionaryKey]  WithHTTPS:0 HTTPSProxy:[[profileController profileDict]objectForKey:kILHTTPSProxyDictionaryKey] HTTPSPort:[[profileController profileDict] objectForKey:kILHTTPSPortDictionaryKey]];
                [ILSystemController startNginxWithCarrier:[ILSystemController lastCarrier]];
                [ILSystemController startPhp];
            }
                break;
            case ILBothProxyAndBGMethod:{
                [ILSystemController changeAndRefreshProxyWithHTTP:1 HTTPProxy:[[profileController profileDict]objectForKey:kILHTTPProxyDictionaryKey] HTTPPort:[[profileController profileDict] objectForKey:kILHTTPPortDictionaryKey]  WithHTTPS:1 HTTPSProxy:[[profileController profileDict]objectForKey:kILHTTPSProxyDictionaryKey] HTTPSPort:[[profileController profileDict] objectForKey:kILHTTPSPortDictionaryKey]];
                [ILSystemController startNginxWithCarrier:[ILSystemController lastCarrier]];
                [ILSystemController startPhp];
                [ILSystemController startHaproxyWithConfFile:[profileController currentHaproxyConf]];
            }
                break;
            case ILBothProxyAndHaproxyMethod:{
                [ILSystemController changeAndRefreshProxyWithHTTP:1 HTTPProxy:[[profileController profileDict]objectForKey:kILHTTPProxyDictionaryKey] HTTPPort:[[profileController profileDict] objectForKey:kILHTTPPortDictionaryKey]  WithHTTPS:1 HTTPSProxy:[[profileController profileDict]objectForKey:kILHTTPSProxyDictionaryKey] HTTPSPort:[[profileController profileDict] objectForKey:kILHTTPSPortDictionaryKey]];
                [ILSystemController stopHaproxy];
                [ILSystemController startHaproxyWithConfFile:[profileController currentHaproxyConf]];
            }
                break;
            default:
                break;
        }
        
        
        while (1) {
            //等待iLmp关闭
            while([ILSystemController checkIlmp]==ILIlmpStartState){
                NSLog(@"opend");
                sleep(10);
            }
            //先检查key
            if( [ILSystemController checkKey] != ILActiveOKState){
                //验证失败的时候
                [ILSystemController stopHaproxy];
                [ILSystemController stopNginx];
                [ILSystemController stopPhp];
                NSLog(@"KeyStop");
                sleep(600);
                continue;
            }
            
            //如果检查成功
            //检查网络时间
            
            NSString * netTimeString = [ILSystemController dateFromNet];
            if ([netTimeString compare:@"F"]==NSOrderedSame ||[netTimeString length ]==0) {
                sleep(600);
                continue;
            }else{
                long long netTime = [netTimeString longLongValue];
                ILState stateKey = [ILSystemController checkKeyWithNetTime:netTime];
                if (stateKey != ILActiveOKState) {
                    [ILSystemController stopPhp];
                    [ILSystemController stopNginx];
                    [ILSystemController stopHaproxy];
                    NSLog(@"NetStop");
                }
            }
            
            sleep(600);
        }

    }
    @catch (NSException *exception) {
        main(0, 0);
    }
    @finally {
        
    }
        return 0;
}