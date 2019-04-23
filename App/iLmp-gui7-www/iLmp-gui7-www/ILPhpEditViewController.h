//
//  ILPhpEditViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/28.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILSlideViewController.h"

@interface ILPhpEditViewController : ILSlideViewController<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *editView;

@end
