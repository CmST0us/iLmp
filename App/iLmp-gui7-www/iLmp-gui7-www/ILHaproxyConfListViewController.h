//
//  ILHaproxyConfListViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/29.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILSlideTableViewController.h"

@interface ILHaproxyConfListViewController : ILSlideTableViewController{
    NSMutableArray *confListArray;
}
 @property(nonatomic,strong)   NSMutableArray *confListArray;
@end
