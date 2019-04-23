//
//  ILProfileFileController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/24.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ILBothProxyAndBGMethod,
    ILHTTPProxyAndBGMethod,
    ILBothProxyAndHaproxyMethod,
    ILHTTPProxyOnly
} ILProxyStartMethod ;

typedef enum : NSUInteger {
    ILProxyStopMethodProxyOnly,
    ILProxyStopMethodProxyAndBG
} ILProxyStopMethod ;
@interface ILProfileFileController : NSObject{
    NSDictionary * profileDict;
    @private
    NSString * path;
}
@property(nonatomic,strong) NSDictionary * profileDict;
-(instancetype)initWithDictPath:(NSString *)path;
-(void)setCarrier:(NSString*)carrier;
-(void)setKey:(NSString*)key;
-(void)setHTTPProxy:(NSString*)httpIP
           HTTPPort:(NSString*)httpPort
         HTTPSProxy:(NSString*)httpsIP
          HTTPSPort:(NSString*)httpsPort;
-(void)setProxyStartMethod:(ILProxyStartMethod)startMethod;
-(ILProxyStartMethod)getStartMethod;
-(void)setProxyStopMethod:(ILProxyStopMethod)stopMethod;
-(ILProxyStopMethod)getStopMethod;

-(NSString*)currentHaproxyConf;
-(void)setHaproxyConf:(NSString*)conf;
-(void)output;
@end
