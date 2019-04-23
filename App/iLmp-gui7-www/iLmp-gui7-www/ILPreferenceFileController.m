//
//  ILPreferenceFileController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/24.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILPreferenceFileController.h"
#import "ILDefine.h"
@implementation ILPreferenceFileController
@synthesize apn = _apn;
@synthesize proxyDict = _proxyDict;
-(instancetype)initWithPreferenceAtPath:(NSString *)apath{
    self = [super init];
    if (self) {
        path = apath;
        preferenceDict = [[NSDictionary alloc]initWithContentsOfFile:path];
        networkServicesDict = [preferenceDict objectForKey:@"NetworkServices"];
        for (NSString *key in networkServicesDict) {
            NSDictionary *tDict1 = [networkServicesDict objectForKey:key];
            NSString *tStr1 = [tDict1 objectForKey:@"UserDefinedName"];
            if ([tStr1 rangeOfString:@"(ip1)"].length >0 ) {
                ip1KeyString = key;
                ip1Dict = tDict1;
                break;
            }
        }

        
        return self;
    }
    return self;
}
-(NSString*)getAPN{
    NSDictionary *tDict1 = [ip1Dict objectForKey:@"com.apple.CommCenter"];
    NSDictionary *tDict2 = [tDict1 objectForKey:@"Setup"];
    NSString * tStr1 = [tDict2 objectForKey:@"apn"];
    return tStr1;
}
-(NSDictionary*)getProxyDict{
    return [ip1Dict objectForKey:@"Proxies"];
}
-(void)setProxyDict:(NSDictionary *)proxyDict{
    NSMutableDictionary * tMDict1 = [[NSMutableDictionary alloc]initWithDictionary:ip1Dict];
    [tMDict1 setObject:proxyDict forKey:@"Proxies"];
    ip1Dict =tMDict1;
    [self refeshAfterSettingip1Dict];
}

-(void)refeshAfterSettingip1Dict{
    NSMutableDictionary *tMDict2 = [[NSMutableDictionary alloc]initWithDictionary:networkServicesDict];
    [tMDict2 setObject:ip1Dict forKey:ip1KeyString];
    networkServicesDict = tMDict2;
    NSMutableDictionary *tMDict3 = [[NSMutableDictionary alloc]initWithDictionary:preferenceDict];
    [tMDict3 setObject:networkServicesDict forKey:@"NetworkServices"];
    preferenceDict = tMDict3;
}

+(NSDictionary *)createAProxyDictWithHTTPEnable:(int)http_power
                                       HTTPPort:(int)http_port
                                      HTTPProxy:(NSString*)http_url
                                    HTTPSEnable:(int)https_power
                                       HTTPSPort:(int)https_port
                                      HTTPSProxy:(NSString*)https_url{
    NSMutableDictionary * tMDict1 = [[NSMutableDictionary alloc]init];

    [tMDict1 setObject:[[NSNumber alloc]initWithInt:http_power] forKey:@"HTTPEnable"];
    [tMDict1 setObject:[[NSNumber alloc]initWithInt:http_port] forKey:@"HTTPPort"];
    [tMDict1 setObject:http_url forKey:@"HTTPProxy"];
    
    [tMDict1 setObject:[[NSNumber alloc]initWithInt:https_power] forKey:@"HTTPSEnable"];
    [tMDict1 setObject:[[NSNumber alloc]initWithInt:https_port] forKey:@"HTTPSPort"];
    [tMDict1 setObject:https_url forKey:@"HTTPSProxy"];
    
    return tMDict1;
}

+(NSDictionary*)createADNSDict:(NSArray*)DNS{
    NSDictionary *dnsDict = [[NSDictionary alloc]initWithObjectsAndKeys:DNS,@"ServerAddresses", nil];
    return dnsDict;
}
-(NSDictionary*)getDNSDict{
    
    return [ip1Dict objectForKey:@"DNS"];
}

-(void)setDNSDict:(NSDictionary *)dnsDict{
    NSMutableDictionary * tDict = [[NSMutableDictionary alloc]initWithDictionary:ip1Dict];
    [tDict setObject:dnsDict forKey:@"DNS"];
    ip1Dict = tDict;
    [self refeshAfterSettingip1Dict];
}
-(void)removeCustomDNS{
    NSMutableDictionary * tDict = [[NSMutableDictionary alloc]initWithDictionary:ip1Dict];
    [tDict removeObjectForKey:@"DNS"];
    ip1Dict = tDict;
    [self refeshAfterSettingip1Dict];
}
-(void)outputDict{
    [preferenceDict writeToFile:path atomically:YES];
}
@end
