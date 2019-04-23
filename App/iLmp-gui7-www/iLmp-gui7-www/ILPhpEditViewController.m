//
//  ILPhpEditViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/28.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILPhpEditViewController.h"
#import "ILDefine.h"
@interface ILPhpEditViewController ()

@end

@implementation ILPhpEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"php配置";
    self.editView.text = [[NSString alloc]initWithContentsOfFile:kILPhpConfPath encoding:NSUTF8StringEncoding error:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]compare:@"phpConfDidFinishEditSegue"]==NSOrderedSame) {
        [self.editView.text writeToFile:kILPhpConfPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}


@end
