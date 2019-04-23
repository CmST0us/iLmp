//
//  ILDefine.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/21.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//gobal Configure
#define kILMainStoryBoardFileName @"StoryBoard"
#define kILNumberOfAllViewController 5
#define kILProfilePath @"/var/mobile/Library/Preferences/com.CmST0us.iLmp-gui7.plist"
#define kILPreferencePath @"/var/preferences/SystemConfiguration/preferences.plist"
#define kILVersionMoto @"版本号2.3\n核心"
///Proxy Configure
#define kILHTTPProxyPort 80
#define kILHTTPProxyURL @"127.0.0.1"
#define kILHTTPSProxyPort 8001
#define kILHTTPSProxyURL @"127.0.0.1"
///
///Nginx Configure
#define kILNginxBinPath @"/usr/local/nginx/sbin/nginx"
#define kILNginxCmccConfPath @"/usr/local/nginx/conf/nginx-cmcc.conf"
#define kILNginxUniConfPath @"/usr/local/nginx/conf/nginx-uni.conf"
#define kILNginxPrefixPath @"/usr/local/nginx"
///
///PHP Configure
#define kILPhpBinPath @"/usr/local/php/sbin/php-fpm"
#define kILPhpPrefixPath @"/usr/local/php/"
#define kILPhpConfPath @"usr/local/php/etc/php-fpm.conf"
///
///Haproxy Configure
#define kILHaproxyBinPath @"/usr/local/haproxy/sbin/haproxy"
#define kILHaproxyConfPath @"/usr/local/haproxy/sbin"

///State Text
#define kILActiceNeedKeyText @"未激活"
#define kILActiveTimeFaildText @"序列号过期"
#define kILActiveUDIDFailedText @"序列号不正确"
#define kILProxyUnsetText @"代理未打开"
#define kILNginxFailedText @"Nginx未打开"
#define kILPhpFailedText @"php未打开"
#define kILStateOKText @"运行中"
//

//Dictionary Configure
/// Value
#define kILUnionDictionaryValue @"ChinaUnion"
#define kILCmccDictionaryValue @"CMCC"
#define kILProxyStartMethodBothAndBGDictionaryValue @"Both"
#define kILProxyStartMethodHTTPAndBGDictionaryValue @"HTTP_BG"
#define kILProxyStartMethodHTTPOnlyDictionaryValue @"HTTP_Only"
#define kILProxyStartMethodBothAndHaproxyMethodDictionaryValue @"Both_Hap"
#define kILProxyStopMethodProxyAndBGDictionaryValue @"Both"
#define kILProxyStopMethodProxyOnlyDictionaryValue @"Proxy_Only"
///
///Dictionary Key
#define kILCarrierDictionaryKey @"Carrier"
#define kILKeyDictionaryKey @"Key"
#define kILHTTPProxyDictionaryKey @"HTTPProxy"
#define kILHTTPPortDictionaryKey @"HTTPPort"
#define kILHTTPSProxyDictionaryKey @"HTTPSProxy"
#define kILHTTPSPortDictionaryKey @"HTTPSPort"
#define kILProxyStartMethodDictionaryKey @"StartMehoed"
#define kILProxyStopMethodDictionaryKey @"StopMethod"
#define kILHaproxyCurrntConfDictionaryKey @"Haproxy_Current_Conf"
///
//

//MenuIndexAndID
#define kILMainViewStoryBoardID @"mainView"
#define kILMainViewIndex 0

#define kILNetSettingViewStoryBoardID @"netSettingView"
#define kILNetSettingViewIndex 1

#define kILNginxSettingViewStoryBoardID @"nginxSettingView"
#define kILNginxSettingViewIndex 2

#define kILPhpSettingViewStoryBoardID @"phpSettingView"
#define kILPhpSettingViewIndex 3

#define kILHaproxySettingViewStoryBoardID @"haproxySettingView"
#define kILHaproxySettingViewIndex 4
//#define kILPfctlSettingViewStoryBoardID @"pfctlSettingView"
//#define kILPfctlSettingViewIndex 5
//

//Segue
#define kILMainViewToBackgroundSettingViewSegue @"201"
#define kILMainViewToNetSettingViewSegue @"202"
//

//NetSettingViewTextFieldTag
#define kILNetSettingViewDNSTextFieldTag 1
#define kILNetSettingViewHTTPIPTextFieldTag 2
#define kILNetSettingViewHTTPPortTextFieldTag 3
#define kILNetSettingViewHTTPSIPTextFieldTag 4
#define kILNetSettingViewHTTPSPortTextFieldTag 5
//#define kILNetSettingViewHTTPSPortTextFieldTag 6
#define kILNetSettingViewKeyTextFieldTag 7
//Notification
#define kILRecvADelegate @"101"
#define kILKeyConfirmFailed @"102" 
//Color
///gery
#define kILgeryColor_r 239.0
#define kILgeryColor_g 239.0
#define kILgeryColor_b 239.0

///blue
#define kILblueColor_r 62.0
#define kILblueColor_g 197.0
#define kILblueColor_b 225.0

///red
#define kILredColor_r 230.0
#define kILredColor_g 102.0
#define kILredColor_b 60.0