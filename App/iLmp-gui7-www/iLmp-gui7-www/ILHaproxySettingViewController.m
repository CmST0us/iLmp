//
//  ILHaproxySettingViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/29.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILHaproxySettingViewController.h"
#import "ILDefine.h"
#import "ILHaproxyConfListViewController.h"
#import "ILSystemController.h"
#import "ILProfileFileController.h"
@interface ILHaproxySettingViewController ()
@property (strong, nonatomic) IBOutlet UITableViewCell *haproxyStateCell;

@end

@implementation ILHaproxySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Haproxy设置";
    
    [self refreshHaproxyState];
    
    
    if ([ILSystemController checkKey] != ILActiveOKState) {
        self.currentConfCell.userInteractionEnabled = NO;
        self.openHaproxyCell.userInteractionEnabled = NO;
    }
    ILProfileFileController * profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
    
    self.currentConfCell.detailTextLabel.text = [profileController currentHaproxyConf];

    
    // Do any additional setup after loading the view.
}
-(void)refreshHaproxyState{
    if ([ILSystemController checkHaproxy] == ILHaproxyOKState) {
        self.haproxyStateCell.detailTextLabel.text = @"运行";
        
    }else{
        self.haproxyStateCell.detailTextLabel.text = @"停止";
    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 1:
        {
            switch (indexPath.row) {
                case 1:
                {
                    //open
                    [ILSystemController stopHaproxy];
                    ILProfileFileController * profileController = [[ILProfileFileController alloc]initWithDictPath:kILProfilePath];
                    [ILSystemController startHaproxyWithConfFile:[profileController currentHaproxyConf]];
                    if ([ILSystemController checkHaproxy] == ILHaproxyFailedState) {
                         [self refreshHaproxyState];
                        [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"Haproxy启动失败" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                        
                    }else{
                         [self refreshHaproxyState];
                        [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"Haproxy启动成功" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
                        
                    }
                   
                    
                }
                    break;
                case 2:{
                    [ILSystemController stopHaproxy];
                    [self refreshHaproxyState];
                    [[[UIAlertView alloc]initWithTitle:@"iLmp-gui7" message:@"已关闭Haproxy" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]show];
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
    if ([[segue identifier] compare:@"haproxyChooseConfSegue"] == NSOrderedSame) {
        ((ILHaproxyConfListViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
        
    }
}


@end
