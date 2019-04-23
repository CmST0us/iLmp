//
//  ILNetSettingViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/23.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILNetSettingViewController.h"
#import "ILSystemController.h"
#import "ILDefine.h"
#import "MBProgressHUD.h"
#import "UIDevice+MobileGestaltCategory.h"
#import "ILProfileFileController.h"
@interface ILNetSettingViewController ()

@end

@implementation ILNetSettingViewController

@synthesize dnsField,httpIPField,httpPortField,httpsIPField,httpsPortField,udidLabel,keyField;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置";
    if ([ILSystemController checkKey] != ILActiveOKState) {
        self.dnsField.enabled = NO;
        self.httpIPField.enabled = NO;
        self.httpPortField.enabled = NO;
        self.httpsIPField.enabled = NO;
        self.httpsPortField.enabled = NO;
        self.saveButtonCell.userInteractionEnabled = NO;
        self.startMethodBothCell.userInteractionEnabled=NO;
        self.startMethodHTTPAndBGCell.userInteractionEnabled =NO;
        self.startMethodHTTPOnlyCell.userInteractionEnabled = NO;
        self.startMethodBothAndHaproxyCell.userInteractionEnabled = NO;
        self.stopMethodProxyAndBGCell.userInteractionEnabled=NO;
        self.stopMethodProxyOnlyCell.userInteractionEnabled=NO;
        [self.keyField becomeFirstResponder];
    }
    for (NSInteger i = 0; i < [self.tableView numberOfRowsInSection:0]-2; i++) {
        UITableViewCell *tCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if ([tCell.textLabel.text compare:[ILSystemController currentAPN]] == NSOrderedSame) {
            tCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            tCell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    ILPreferenceFileController * aController = [[ILPreferenceFileController alloc]initWithPreferenceAtPath:kILPreferencePath];
    NSDictionary * tDictDNS = [aController getDNSDict];
    if (tDictDNS) {
       self.dnsField.text =  [(NSArray*)[tDictDNS objectForKey:@"ServerAddresses"] componentsJoinedByString:@","];
    }
    
    //设置本机udid
    self.udidLabel.text = [[UIDevice currentDevice]UDID];
    //设置圆圈打开动作
    ILProfileFileController *profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
    switch ([profileController getStartMethod]) {
        case ILBothProxyAndBGMethod:
        {
            self.startMethodBothCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        case ILHTTPProxyAndBGMethod:{
            self.startMethodHTTPAndBGCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        case ILHTTPProxyOnly:{
            self.startMethodHTTPOnlyCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        case ILBothProxyAndHaproxyMethod:{
            self.startMethodBothAndHaproxyCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        default:
            break;
    }
   //设置ProxyField
    self.httpIPField.text = [[profileController profileDict]objectForKey:kILHTTPProxyDictionaryKey];
    self.httpPortField.text = [[profileController profileDict]objectForKey:kILHTTPPortDictionaryKey];
    self.httpsPortField.text = [[profileController profileDict]objectForKey:kILHTTPSPortDictionaryKey];
    self.httpsIPField.text = [[profileController profileDict]objectForKey:kILHTTPSProxyDictionaryKey];
    //设置圆圈关闭动作

    switch ([profileController getStopMethod]) {
        case ILProxyStopMethodProxyAndBG:
        {
            self.stopMethodProxyAndBGCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        case ILProxyStopMethodProxyOnly:{
            self.stopMethodProxyOnlyCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
            break;
        default:
            break;
    }
    //设置key
    self.keyField.text = [[profileController profileDict]objectForKey:kILKeyDictionaryKey];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row == 0 || indexPath.row ==1||indexPath.row == 2 || indexPath.row == 3) {
                //寻找上一次打钩的cell
                
                UITableViewCell * lastCell ;
                for (NSUInteger i = 0 ; i < [tableView numberOfRowsInSection:0]-2 ; i++) {
                    UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
                    if (tCell.accessoryType == UITableViewCellAccessoryCheckmark) {
                        lastCell = tCell;
                    }
                }
                
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                [ILSystemController changeApn:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
                MBProgressHUD * HUD = [[MBProgressHUD alloc]initWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                                       
                HUD.labelText = @"切换中";
                HUD.dimBackground =YES;
                [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:HUD];
                [HUD show:YES];
                dispatch_async(dispatch_get_global_queue(0, 0),^{
                    
                    [ILSystemController refreshApn];
                    sleep(8);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [HUD hide:YES];
                        lastCell.accessoryType = UITableViewCellAccessoryNone;
                        cell.accessoryType = UITableViewCellAccessoryCheckmark;
                        
                    });
                });
            }
        }
            if (indexPath.row == 5 ){
                system("rm -f /var/Managed\\ Preferences/mobile/com.apple.managedCarrier.plist");
                MBProgressHUD * HUD = [[MBProgressHUD alloc]initWithView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
                
                HUD.labelText = @"恢复中";
                HUD.dimBackground =YES;
                [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:HUD];
                [HUD show:YES];
                dispatch_async(dispatch_get_global_queue(0, 0),^{
                    
                    [ILSystemController refreshApn];
                    sleep(8);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [HUD hide:YES];
                        [self viewDidLoad];
                    });
                });

            }
            break;
        case 5:{
            //复制udid按钮
            if (indexPath.row == 0) {
                UIPasteboard * pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = self.udidLabel.text;
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"复制成功" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [alert show];
            }

        }
            break;
        case 1:{
            //保存按钮
            if (indexPath.row == 4) {
            ILProfileFileController * profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                [profileController setHTTPProxy:self.httpIPField.text HTTPPort:self.httpPortField.text HTTPSProxy:self.httpsIPField.text HTTPSPort:self.httpsPortField.text];
                [profileController output];
                [self resignResponder];
            }
        }
            break;
        case 2:{
            //打开动作
            for (NSUInteger i = 0 ; i < [tableView numberOfRowsInSection:2] ; i++) {
                UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:2]];
                if (tCell.accessoryType == UITableViewCellAccessoryCheckmark) {
                    tCell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
            switch (indexPath.row) {
                case 0:{
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStartMethod:ILHTTPProxyAndBGMethod];
                    [profileController output];
                    UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
                    tCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    
                }
                    break;
                case 1:{
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStartMethod:ILBothProxyAndBGMethod];
                    [profileController output];
                    UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]];
                    tCell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                case 2:{
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStartMethod:ILHTTPProxyOnly];
                    [profileController output];
                    UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:2]];
                    tCell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                case 3:{
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStartMethod:ILBothProxyAndHaproxyMethod];
                    [profileController output];
                    UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:2]];
                    tCell.accessoryType = UITableViewCellAccessoryCheckmark;

                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 4:{
            if (indexPath.row == 0) {
                [ILSystemController changAndRefreshProxyWithHTTP:0 HTTPS:0];
                [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已关闭代理" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
            }
        }
            break;
        case 3:{
            for (NSUInteger i = 0 ; i < [tableView numberOfRowsInSection:3] ; i++) {
                UITableViewCell *tCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:3]];
                if (tCell.accessoryType == UITableViewCellAccessoryCheckmark) {
                    tCell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
            switch (indexPath.row) {
                case 0:
                {
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStopMethod:ILProxyStopMethodProxyOnly];
                    [profileController output];
                    self.stopMethodProxyOnlyCell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                case 1:{
                    ILProfileFileController * profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [profileController setProxyStopMethod:ILProxyStopMethodProxyAndBG];
                    [profileController output];
                    self.stopMethodProxyAndBGCell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                default:
                    break;
            }

        }
            break;
        default:
            break;
    }
    [[tableView cellForRowAtIndexPath:indexPath]setSelected:NO animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    switch (textField.tag) {
        case kILNetSettingViewDNSTextFieldTag:{
            if ([textField.text rangeOfString:@","].length == 0) {
                NSArray * tArray = @[textField.text];
                [ILSystemController changeDNS:tArray];
                [textField resignFirstResponder];
            }else{
                NSArray *tArray = [textField.text componentsSeparatedByString:@","];
                [ILSystemController changeDNS:tArray];
                [textField resignFirstResponder];
            }
            if ([textField.text length] == 0) {
                //删除自定义DNS
                [ILSystemController removeDNS];
            }
        }
            break;
        case kILNetSettingViewKeyTextFieldTag:{
            ILProfileFileController * profileController =  [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
            [profileController setKey:textField.text];
            [profileController output];
            if([self isActivity]){
                
                [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"激活成功，请重新打开程序" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                /*
                UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc]init];
                action.identifier = @"iLmpDateNogood";
                action.title = @"续费";
                action.activationMode = UIUserNotificationActivationModeForeground;
                UIMutableUserNotificationCategory *c = [[UIMutableUserNotificationCategory alloc]init];
                c.identifier = @"iLmpDateNogoodCategory";
                [c setActions:@[action] forContext:(UIUserNotificationActionContextMinimal)];
                UIUserNotificationSettings *set = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge categories:[NSSet setWithObjects:c, nil]];
                [[UIApplication sharedApplication]registerUserNotificationSettings:set];
                [[UIApplication sharedApplication]registerForRemoteNotifications];
                UILocalNotification *notifi = [[UILocalNotification alloc]init];
                notifi.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
                notifi.timeZone = [NSTimeZone defaultTimeZone];
                notifi.alertBody = @"您的iLmp-gui7将于2天后过期,请及时续费";
                notifi.category = @"iLmpDateNogoodCategory";
                [[UIApplication sharedApplication] scheduleLocalNotification:notifi];
            */
                 }else{
                [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"激活失败，请检查序列号" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
            
            }
            [textField resignFirstResponder];
        }

            break;
        default:
            [textField resignFirstResponder];
            break;
    
}
    return YES;
}
-(void)systemNeedActive{
        [self.keyField becomeFirstResponder];
}
-(BOOL)isActivity{
    if( [ILSystemController checkKey] != ILActiveOKState){
        return NO;
    }else{
        return YES;
    }
}
-(void)resignResponder{
    [self.dnsField resignFirstResponder];
    [self.httpIPField resignFirstResponder];
    [self.httpPortField resignFirstResponder];
    [self.httpsIPField resignFirstResponder];
    [self.httpsPortField resignFirstResponder];
    [self.keyField resignFirstResponder];
    
    
}
@end
