//
//  ILNginxSettingViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/23.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILNginxSettingViewController.h"
#import "ILSystemController.h"
#import "ILProfileFileController.h"
#import "ILPreferenceFileController.h"
#import "ILDefine.h"
#import "ILNginxEditViewController.h"
@interface ILNginxSettingViewController ()

@end

@implementation ILNginxSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"nginx设置";
    if(![self isActivity]){
        self.openNginxCell.userInteractionEnabled = NO;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)isActivity{
    if( [ILSystemController checkKey] != ILActiveOKState){
        return NO;
    }else{
        return YES;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    [ILSystemController stopNginx];
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已关闭Nginx" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                }
                    break;
                case 1:{
                    [ILSystemController stopNginx];
                    [ILSystemController startNginxWithCarrier:[ILSystemController lastCarrier]];
                    if ([ILSystemController checkNginx] == ILNginxFailedState){
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"打开Nginx失败" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                    }else{
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已打开Nginx" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                    }
                }
                    break;
                case 2:{
                    system("rm -f /usr/local/nginx/logs/access.log /usr/local/nginx/logs/error.log");
                [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已清除nginx日志" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]compare:@"nginxUniWillEditSegue"] == NSOrderedSame) {
        //uni
        ((ILNginxEditViewController*)[segue destinationViewController]).editCarrier = ILNginxEditChinaUniCarrier;
        ((ILNginxEditViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
    }
    if ([[segue identifier]compare:@"nginxCmccWillEditSegue"] == NSOrderedSame) {
        //cmcc
        ((ILNginxEditViewController*)[segue destinationViewController]).editCarrier = ILNginxEditCmccCarrier;
        ((ILNginxEditViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
    }
}


@end
