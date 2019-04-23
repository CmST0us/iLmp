//
//  ILMainViewController.m
//  iLmp-gui7
//
//  Created by CmST0us on 14-4-6.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//
#import "ILMainViewController.h"
#import "MBProgressHUD.h"
#import "ILSystemController.h"
#import "NSString+AES256.h"
#import "UIDevice+MobileGestaltCategory.h"
#import "ILDefine.h"
#import "ILProfileFileController.h"
#import "ILBackGroundSettingViewController.h"
#import "ILNetSettingViewController.h"
@interface ILMainViewController ()
@property (strong, nonatomic) IBOutlet UIButton *activityButton;
@end

@implementation ILMainViewController
@synthesize apnLabel = _apnLabel;
@synthesize stateLabel = _stateLabel;
@synthesize banngerImage= _banngerImage;

- (IBAction)servicesFix:(id)sender {
       MBProgressHUD * HUD = [[MBProgressHUD alloc]initWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    HUD.dimBackground = YES;
    HUD.labelText = @"修复中";
    if (sender == nil) {
        HUD.labelText  = @"切换中";
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:HUD];
    [HUD show:YES];
    [HUD hide:YES afterDelay:1.5f];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [ILSystemController chmodAndchownTheWWW];
            [ILSystemController stopPhp];
            [ILSystemController stopNginx];
            [ILSystemController startPhp];
            [ILSystemController startNginxWithCarrier:[ILSystemController lastCarrier]];
            [self settingState];
        });
    });
}
-(void)showILInformations{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:kILVersionMoto delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil,nil];
    [alert show];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"iLmp-gui7 /www";
    UIBarButtonItem * infomaionBarInNav = [[UIBarButtonItem alloc]init];
    infomaionBarInNav.title =@"关于";
    infomaionBarInNav.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = infomaionBarInNav;
    infomaionBarInNav.target=self;
    infomaionBarInNav.action=@selector(showILInformations);
 
    //判断上次运营商
    ILCarrier lastCarrier = [ILSystemController lastCarrier];
    switch (lastCarrier) {
        case ILUnionCarrier:
            self.carrierSegmented.selectedSegmentIndex = 0;
            break;
        case ILCmccCarrier:
            self.carrierSegmented.selectedSegmentIndex = 1;
            break;
        default:
            break;
    }
    //设置APN
    self.apnLabel.text = [ILSystemController currentAPN];
    //设置状态
    [self settingState];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationDidBecomeActive) name:
  UIApplicationDidBecomeActiveNotification object:[UIApplication sharedApplication]];

}
-(void)keyDidFailed{
    [ILSystemController stopNginx];
    [ILSystemController stopPhp];
    [ILSystemController changAndRefreshProxyWithHTTP:0 HTTPS:0];
    self.activityButton.hidden = NO;
    self.banngerButton.enabled = NO;
    self.backgroundMangerButton.enabled =NO;
    self.servicesFixButton.enabled = NO;
    self.carrierSegmented.enabled = NO;
}
-(void)settingState{
    ILState keyState = [ILSystemController checkKey];
    switch (keyState) {
        case ILActiveTimeFaildState:
            self.stateLabel.text = kILActiveTimeFaildText;
                [self stopronation];
            [self keyDidFailed];
            return;
            break;
        case ILActiveUDIDFailedState:
            self.stateLabel.text =kILActiveUDIDFailedText;
                [self stopronation];
            [self keyDidFailed];
            return;
        case ILActiceNeedKeyState:
            self.stateLabel.text = kILActiceNeedKeyText;
                [self stopronation];
            [self keyDidFailed];
            return;
            break;
        case ILActiveOKState:{
            self.activityButton.hidden = YES;
            self.banngerButton.enabled = YES;
            self.backgroundMangerButton.enabled =YES;
            self.servicesFixButton.enabled = YES;
            self.carrierSegmented.enabled = YES;
        }break;
        default:
            
            break;
    }
    ILState proxyState = [ILSystemController checkProxy];
    switch (proxyState) {
        case ILProxyUnsetState:
            self.stateLabel.text = kILProxyUnsetText;
                [self stopronation];
            return;
            break;
        case ILProxyBothSetState:
            break;
        case ILProxyHTTPSetState:
            break;
        case ILProxyHTTPSSetState:
            break;
        default:
            break;
    }
    ILProfileFileController *profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
    if ([profileController getStartMethod] == ILBothProxyAndHaproxyMethod) {
        ILState proState = [ILSystemController checkHaproxy];
        if (proState == ILHaproxyOKState) {
            self.stateLabel.text = kILStateOKText;
            [self ronation];
            return;
        }else{
            self.stateLabel.text = kILHaproxyFailedText;
            [self stopronation];
            return;
        }
    }
    ILState nginxState = [ILSystemController checkNginx];
    switch (nginxState) {
        case ILNginxFailedState:
            self.stateLabel.text =kILNginxFailedText;
                [self stopronation];
            return;
            break;
        default:
            break;
    }
    ILState phpState = [ILSystemController checkPhp];
    switch (phpState) {
        case ILPhpFailedState:
            self.stateLabel.text = kILPhpFailedText;
                [self stopronation];
            return;
            break;
        default:
            break;
    }

    self.stateLabel.text = kILStateOKText;
    [self ronation];
}
-(void)applicationDidBecomeActive{
    [self settingState];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ronation{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 3.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [self.banngerImage.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
-(void)stopronation{
    [self.banngerImage.layer removeAllAnimations];
}



- (IBAction)changeProxy:(id)sender {
    ILState state = [ILSystemController checkProxy];
    if (state == ILProxyUnsetState) {
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

        [self ronation];
    }else{
        ILProfileFileController * profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
        switch ([profileController getStopMethod]) {
            case ILProxyStopMethodProxyOnly:{
                [ILSystemController changAndRefreshProxyWithHTTP:0 HTTPS:0];
            }
                
                break;
            case ILProxyStopMethodProxyAndBG:{
                [ILSystemController changAndRefreshProxyWithHTTP:0 HTTPS:0];
                [ILSystemController stopNginx];
                [ILSystemController stopPhp];
                [ILSystemController stopHaproxy];
            }
                break;
            default:
                break;
        }
        
        
        [self stopronation];
    }
    [self settingState];
}
- (IBAction)changeCarrier:(id)sender {
    switch ( self.carrierSegmented.selectedSegmentIndex) {
        case 0:{
            ILProfileFileController *profileController =[[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
            [profileController setCarrier:kILUnionDictionaryValue];
            [profileController output];
        }
            break;
        case 1:{
            ILProfileFileController *profileController =[[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
            [profileController setCarrier:kILCmccDictionaryValue];
            [profileController output];
        }
            break;
        default:
            break;
            
    }
    [self servicesFix:nil];
}


@end

