//
//  ILProfileFileController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/24.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILProfileFileController.h"
#import "ILDefine.h"

@implementation ILProfileFileController
@synthesize profileDict;
-(instancetype)initWithDictPath:(NSString *)apath{
    self = [super init];
    if (self) {
        profileDict = [[NSDictionary alloc]initWithContentsOfFile:apath];
        path = apath;
        return self;
    }
    return self;
}
-(void)setCarrier:(NSString *)carrier{
    NSMutableDictionary * tMDict1= [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    [tMDict1 setObject:carrier forKey:kILCarrierDictionaryKey];
    profileDict = tMDict1;
}
-(void)setKey:(NSString *)key{
    NSMutableDictionary *tMDict1 = [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    [tMDict1 setObject:key forKey:kILKeyDictionaryKey];
    profileDict = tMDict1;
}
-(void)setHTTPProxy:(NSString*)httpIP
           HTTPPort:(NSString*)httpPort
         HTTPSProxy:(NSString*)httpsIP
          HTTPSPort:(NSString*)httpsPort{
    NSMutableDictionary * tDict = [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    
    [tDict setObject:httpIP forKey:kILHTTPProxyDictionaryKey];
    [tDict setObject:httpPort forKey:kILHTTPPortDictionaryKey];
    [tDict setObject:httpsIP forKey:kILHTTPSProxyDictionaryKey];
    [tDict setObject:httpsPort forKey:kILHTTPSPortDictionaryKey];
    profileDict = tDict;
}
-(void)setProxyStartMethod:(ILProxyStartMethod)startMethod{
    NSMutableDictionary *tMDict = [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    switch (startMethod) {
        case ILBothProxyAndBGMethod:{
            [tMDict setObject:kILProxyStartMethodBothAndBGDictionaryValue forKey:kILProxyStartMethodDictionaryKey];
        }
            break;
        case ILHTTPProxyAndBGMethod:{
            [tMDict setObject:kILProxyStartMethodHTTPAndBGDictionaryValue forKey:kILProxyStartMethodDictionaryKey];
        }
            break;
        case ILBothProxyAndHaproxyMethod:{
            [tMDict setObject:kILProxyStartMethodBothAndHaproxyMethodDictionaryValue forKey:kILProxyStartMethodDictionaryKey];
        }
            break;
        case ILHTTPProxyOnly:{
            [tMDict setObject:kILProxyStartMethodHTTPOnlyDictionaryValue forKey:kILProxyStartMethodDictionaryKey];
        }
            break;
        default:
            break;
    }
    profileDict = tMDict;
}
-(ILProxyStartMethod)getStartMethod{
    NSString *methodString = [profileDict objectForKey:kILProxyStartMethodDictionaryKey];
    if ([methodString length]==0) {
        methodString = @"no";
    }
    if ([methodString compare:kILProxyStartMethodBothAndBGDictionaryValue] == NSOrderedSame) {
        return ILBothProxyAndBGMethod;
    }
    if ([methodString compare:kILProxyStartMethodHTTPAndBGDictionaryValue] == NSOrderedSame) {
        return ILHTTPProxyAndBGMethod;
    }
    if ([methodString compare:kILProxyStartMethodHTTPOnlyDictionaryValue] == NSOrderedSame) {
        return ILHTTPProxyOnly;
    }
    if ([methodString compare:kILProxyStartMethodBothAndHaproxyMethodDictionaryValue] == NSOrderedSame) {
        return ILBothProxyAndHaproxyMethod;
    }
    return ILHTTPProxyOnly;
}
-(void)setProxyStopMethod:(ILProxyStopMethod)stopMethod{
    NSMutableDictionary *tMDict = [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    switch (stopMethod) {
        case ILProxyStopMethodProxyAndBG:
        {
            [tMDict setObject:kILProxyStopMethodProxyAndBGDictionaryValue forKey:kILProxyStopMethodDictionaryKey];
        }
            break;
        case ILProxyStopMethodProxyOnly:{
            [tMDict setObject:kILProxyStopMethodProxyOnlyDictionaryValue forKey:kILProxyStopMethodDictionaryKey];
        }
            break;
        default:
            break;
    }
    profileDict = tMDict;
}
-(ILProxyStopMethod)getStopMethod{
    NSString *methodString = [profileDict objectForKey:kILProxyStopMethodDictionaryKey];
    if ([methodString length]==0) {
        methodString = @"no";
    }
    if ([methodString compare:kILProxyStopMethodProxyAndBGDictionaryValue] == NSOrderedSame) {
        return ILProxyStopMethodProxyAndBG;
    }
    if ([methodString compare:kILProxyStopMethodProxyOnlyDictionaryValue] == NSOrderedSame) {
        return ILProxyStopMethodProxyOnly;
    }
    return ILProxyStopMethodProxyOnly;
}
-(void)output{
    [profileDict writeToFile:path atomically:YES];
}
-(NSString*)currentHaproxyConf{
   NSString* string= [profileDict objectForKey:kILHaproxyCurrntConfDictionaryKey];
    if ([string length]==0) {
        return @"haproxy.cfg";
    }else{
        return string;
    }
}
-(void)setHaproxyConf:(NSString*)conf{
    NSMutableDictionary * t = [[NSMutableDictionary alloc]initWithDictionary:profileDict];
    [t setObject:conf forKey:kILHaproxyCurrntConfDictionaryKey];
    profileDict = t;
}
@end
