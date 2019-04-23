//
//  ILNginxEditViewController.h
//  iLmp-gui7-www
//
//  Created by CmST0us on 15/7/28.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILSlideViewController.h"
typedef enum : NSUInteger {
    ILNginxEditCmccCarrier,
    ILNginxEditChinaUniCarrier
} ILNginxEditCarrier;
@interface ILNginxEditViewController : ILSlideViewController<UITextViewDelegate>{
    ILNginxEditCarrier editCarrier;
}
@property (strong, nonatomic) IBOutlet UITextView *editView;
@property(nonatomic)ILNginxEditCarrier editCarrier;
@end
