//
//  ILAppDelegate.h
//  iLmp-Creater
//
//  Created by CmST0us on 15/6/14.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSString+AES256.h"
@interface ILAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *udidField;
@property (weak) IBOutlet NSTextField *resultField;
- (IBAction)creatKey:(id)sender;
@property (weak) IBOutlet NSDatePicker *datePicker;

@end
