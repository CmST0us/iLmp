//
//  ILNetSettingViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/23.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILSlideTableViewController.h"

@interface ILNetSettingViewController : ILSlideTableViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *dnsField;
@property (strong, nonatomic) IBOutlet UITextField *httpIPField;
@property (strong, nonatomic) IBOutlet UITextField *httpPortField;
@property (strong, nonatomic) IBOutlet UITextField *httpsIPField;
@property (strong, nonatomic) IBOutlet UITextField *httpsPortField;
@property (strong, nonatomic) IBOutlet UILabel *udidLabel;
@property (strong, nonatomic) IBOutlet UITextField *keyField;
@property (strong, nonatomic) IBOutlet UITableViewCell *startMethodHTTPAndBGCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *startMethodBothCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *startMethodHTTPOnlyCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *startMethodBothAndHaproxyCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *stopMethodProxyOnlyCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *stopMethodProxyAndBGCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *saveButtonCell;
@property (strong, nonatomic) IBOutlet UISwitch *launchAtPowerOnSwitch;

-(void)systemNeedActive;
@end
