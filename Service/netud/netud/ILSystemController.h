//
//  ILSystemController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/23.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILPreferenceFileController.h"
typedef enum : NSUInteger {
    ILUnionCarrier = 1,
    ILCmccCarrier,
    ILError
}ILCarrier ;

typedef enum : NSUInteger {
    ILErrorState,
    ILOKState,
    
    ILPhpOKState,
    ILPhpFailedState,
    
    ILProxyHTTPSetState,
    ILProxyHTTPSSetState,
    ILProxyBothSetState,
    ILProxyUnsetState,
    
    ILNginxOKState,
    ILNginxFailedState,
    
    ILHaproxyOKState,
    ILHaproxyFailedState,
    
    ILAngelOKState,
    ILAngelFailedState,
    
    ILActiveOKState,
    ILActiceNeedKeyState,
    ILActiveUDIDFailedState,
    ILActiveTimeFaildState,
    
    ILIlmpStartState,
    ILIlmpStopState
}ILState ;

@interface ILSystemController : NSObject{

}

+(ILCarrier)currentCarrier;
+(NSString*)currentAPN;
+(ILCarrier)lastCarrier;

+(void)startNginxWithCarrier:(ILCarrier)carrier;
+(void)startPhp;
+(void)startHaproxyWithConfFile:(NSString*)confFile;
+(void)startAngel;
+(void)stopNginx;
+(void)stopPhp;
+(void)stopHaproxy;
+(void)stopAngel;

+(void)changeApn:(NSString*)apn;
+(void)refreshApn;
+(void)changeDNS:(NSArray*)DNS;
+(void)removeDNS;

+(ILState)checkKey;
+(ILState)checkKeyWithNetTime:(long long)time;
+(ILState)checkProxy;
+(ILState)checkNginx;
+(ILState)checkPhp;
+(ILState)checkAngel;
+(ILState)checkHaproxy;
+(ILState)checkIlmp;

+(NSString*)runShell:(NSString*)shell
       withArguments:(NSArray*)argv;

+(void)changAndRefreshProxyWithHTTP:(int)isHTTP
                              HTTPS:(int)isHTTPS;

+(void)changeAndRefreshProxyWithHTTP:(int)isHTTP
                           HTTPProxy:(NSString*)httpProxy
                            HTTPPort:(NSString*)httpPort
                           WithHTTPS:(int)isHTTPS
                          HTTPSProxy:(NSString*)httpsProxy
                           HTTPSPort:(NSString*)httpsPort;
+(void)chmodAndchownTheWWW;
+(NSString *)dateFromNet;
@end
