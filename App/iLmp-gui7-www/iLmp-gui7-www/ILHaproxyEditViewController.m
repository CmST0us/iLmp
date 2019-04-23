//
//  ILHaproxyEditViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/29.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILHaproxyEditViewController.h"
#import "ILDefine.h"
#import "ILHaproxySettingViewController.h"
#import "ILProfileFileController.h"
@interface ILHaproxyEditViewController ()

@end

@implementation ILHaproxyEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.editConfFileName;
    if (self.editConfFileName.length != 0) {
        NSString *confPath = [[NSString alloc]initWithFormat:@"%@/%@",kILHaproxyConfPath,self.editConfFileName];
        NSString* conf = [[NSString alloc]initWithContentsOfFile:confPath encoding:NSUTF8StringEncoding error:nil];
        self.editConfFileTextView.text = conf;
    }

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.editConfFileName = [[alertView textFieldAtIndex:0].text stringByAppendingString:@".cfg"];
    self.title = self.editConfFileName;
    if ([self.editConfFileName length]==4) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"请输入文件名" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.alertViewStyle  = UIAlertViewStylePlainTextInput;
        [alert show];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] compare:@"haproxyConfFileSaveSegue"]==NSOrderedSame) {
        //save
        NSString *savePath = [[NSString alloc]initWithFormat:@"%@/%@",kILHaproxyConfPath,self.editConfFileName];
        [self.editConfFileTextView.text writeToFile:savePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        ILProfileFileController *profileController =    [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
        [profileController setHaproxyConf:self.editConfFileName];
        [profileController output];
        ((ILHaproxySettingViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
    }
}


@end
