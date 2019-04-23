//
//  ILPhpSettingViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/27.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILPhpSettingViewController.h"
#import "ILSlideViewController.h"
#import "ILSystemController.h"
@interface ILPhpSettingViewController ()

@end

@implementation ILPhpSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"php-fpm设置";
    if ([ILSystemController checkKey]!=ILActiveOKState) {
        self.openPhpCell.userInteractionEnabled=NO;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    [ILSystemController stopPhp];
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已关闭php" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                }
                    break;
                case 1:{
                    [ILSystemController stopPhp];
                    [ILSystemController startPhp];
                    if ([ILSystemController checkPhp]==ILPhpOKState) {
                        [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已启动php" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                    }else{
                        [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"启动失败" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                    }
                }
                    break;
                case 2:{
                    system("rm -f /usr/local/php/log/php-fpm.log");
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已清除php-fpm日志" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                }break;
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
    if([[segue identifier]compare: @"phpConfWillEditSegue"]==NSOrderedSame ){
        ((ILSlideViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
    }
}


@end
