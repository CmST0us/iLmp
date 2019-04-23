//
//  ILAppDelegate.m
//  iLmp-Creater
//
//  Created by CmST0us on 15/6/14.
//  Copyright (c) 2015年 CmST0us. All rights reserved.
//

#import "ILAppDelegate.h"

@implementation ILAppDelegate
@synthesize udidField,resultField,datePicker;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)creatKey:(id)sender {
    NSDate * dateFromPicker = [datePicker dateValue];
    NSNumber *dataIntNumber=[[NSNumber alloc]initWithDouble:dateFromPicker.timeIntervalSince1970];
    long long dateLongLongValue =    [dataIntNumber longLongValue];
    NSString *waitForEntryptString = [[NSString alloc]initWithFormat:@"%@||%lld",[udidField stringValue],dateLongLongValue];
    NSString * encryptString = [waitForEntryptString aes256_encrypt:@"S2#Kzu~!"];
    ///NSLog(@"%@",encryptString);
    
    //完成加密－》输出的数据为encryptString
    [resultField setStringValue:encryptString];

}
@end
