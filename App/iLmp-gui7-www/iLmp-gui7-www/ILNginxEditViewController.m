//
//  ILNginxEditViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/28.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//
#import "ILNginxEditViewController.h"
#import "ILDefine.h"
#import "ILNginxSettingViewController.h"
@interface ILNginxEditViewController ()

@end

@implementation ILNginxEditViewController
@synthesize editCarrier;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"nginx配置";
    switch (editCarrier) {
        case ILNginxEditCmccCarrier:
        {
            NSString * conf = [[NSString alloc]initWithContentsOfFile:kILNginxCmccConfPath encoding:NSUTF8StringEncoding error:nil];
            self.editView.text = conf;
        }
            break;
        case ILNginxEditChinaUniCarrier:{
            NSString * conf = [[NSString alloc]initWithContentsOfFile:kILNginxUniConfPath encoding:NSUTF8StringEncoding error:nil];
            self.editView.text = conf;
        }
            break;
        default:
            break;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]compare:@"nginxConfDidFinishEditSegue"] == NSOrderedSame) {
        ((ILNginxSettingViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
        switch (self.editCarrier) {
            case ILNginxEditChinaUniCarrier:
            {
                //uni
                [self.editView.text writeToFile:kILNginxUniConfPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
                break;
            case ILNginxEditCmccCarrier:{
                //cmcc
                [self.editView.text writeToFile:kILNginxCmccConfPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
                break;
            default:
                break;
        }
    }
}


@end
