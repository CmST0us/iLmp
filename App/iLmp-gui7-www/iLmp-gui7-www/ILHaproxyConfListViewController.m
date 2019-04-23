//
//  ILHaproxyConfListViewController.m
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/29.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILHaproxyConfListViewController.h"
#import "ILDefine.h"
#import "ILHaproxyEditViewController.h"

@interface ILHaproxyConfListViewController ()

@end

@implementation ILHaproxyConfListViewController
@synthesize confListArray;
- (void)viewDidLoad {
    [super viewDidLoad];

    self.confListArray = [[NSMutableArray alloc]init];
   NSArray *filesAtPath = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:kILHaproxyConfPath error:nil];
    NSString *e_string;
    for (e_string in filesAtPath) {
        if (([e_string rangeOfString:@".cfg"].length) > 0 && e_string.length > 4) {
            [self.confListArray addObject:e_string];
        }
    }

     // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [confListArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"haproxyConfFileListCell"];
    cell.textLabel.text = [confListArray objectAtIndex:indexPath.row];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      NSString *delString  =  [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        NSString *delPath = [[NSString alloc]initWithFormat:@"%@/%@",kILHaproxyConfPath,delString];
        [[NSFileManager defaultManager]removeItemAtPath:delPath error:nil];
        [self.confListArray removeObject:delString];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"请急速左划来删除配置(可能因为您的左划速度不足导致删除按钮不出现)";
    }
    return @"";
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] compare:@"haproxyConfFileCreateSegue"] == NSOrderedSame) {
        //
        ((ILHaproxyEditViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"新建一个配置文件" message:@"请输入文件名" delegate:[segue destinationViewController] cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alertView show];
    }else if([[segue identifier] compare:@"haproxyConfFileEditSegue"] == NSOrderedSame){
        //
        ((ILHaproxyEditViewController*)[segue destinationViewController]).hamburgerDelegate = self.hamburgerDelegate;
        UITableViewCell *cell = (UITableViewCell*)sender;
        ((ILHaproxyEditViewController*)[segue destinationViewController]).editConfFileName = cell.textLabel.text;
    }
}


@end
