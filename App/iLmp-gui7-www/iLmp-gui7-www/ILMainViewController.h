//
//  ILMainViewController.h
//  iLmp-gui7
//
//  Created by CmST0us on 14-4-6.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ILSlideTableViewController.h"
#import "MBProgressHUD.h"
#import "ILSlideViewController.h"
@interface ILMainViewController :ILSlideViewController <MBProgressHUDDelegate,UIAlertViewDelegate>{
    
}

@property(nonatomic,strong)IBOutlet UILabel *apnLabel;
@property(nonatomic,strong)IBOutlet UILabel *stateLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *carrierSegmented;

@property (strong, nonatomic) IBOutlet UIImageView *banngerImage;
@property (strong, nonatomic) IBOutlet UIButton *banngerButton;
@property (strong, nonatomic) IBOutlet UIButton *backgroundMangerButton;
@property (strong, nonatomic) IBOutlet UIButton *servicesFixButton;


- (IBAction)servicesFix:(id)sender;
- (IBAction)changeProxy:(id)sender;




@end
