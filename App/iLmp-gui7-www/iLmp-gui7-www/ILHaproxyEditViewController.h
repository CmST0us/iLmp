//
//  ILHaproxyEditViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/29.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILSlideViewController.h"

@interface ILHaproxyEditViewController : ILSlideViewController<UIAlertViewDelegate>
@property(nonatomic,strong)NSString* editConfFileName;
@property (strong, nonatomic) IBOutlet UITextView *editConfFileTextView;

@end
