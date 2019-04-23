//
//  ILPreferenceFileController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/24.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILPreferenceFileController : NSObject{
    NSDictionary *preferenceDict;
    NSDictionary *networkServicesDict;
    NSDictionary *ip1Dict;
    @private
    NSString *path;
    NSString *ip1KeyString;
}
-(instancetype)initWithPreferenceAtPath:(NSString *)path;
+(NSDictionary *)createAProxyDictWithHTTPEnable:(int)http_power
                                       HTTPPort:(int)http_port
                                      HTTPProxy:(NSString*)http_url
                                    HTTPSEnable:(int)https_power
                                       HTTPSPort:(int)https_port
                                      HTTPSProxy:(NSString*)https_url;
+(NSDictionary*)createADNSDict:(NSArray*)DNS;
-(void)removeCustomDNS;
-(void)outputDict;

@property(nonatomic,getter=getAPN)NSString *apn;
@property(nonatomic,getter=getProxyDict,setter=setProxyDict:)NSDictionary *proxyDict;
@property(nonatomic,getter=getDNSDict,setter=setDNSDict:)NSDictionary *dnsDict;
@end
