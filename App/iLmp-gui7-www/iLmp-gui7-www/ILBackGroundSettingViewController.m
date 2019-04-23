//
//  ILBackGroundSettingViewController.m
//  iLmp-gui7
//
//  Created by CmST0us on 14-7-27.
//  Copyright (c) 2014年 CmST0us. All rights reserved.
//

#import "ILBackGroundSettingViewController.h"
#import "ILSystemController.h"
@interface ILBackGroundSettingViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *WebView;

@end

@implementation ILBackGroundSettingViewController
@synthesize hamburgerDelegate =_hamburgerDelegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSString*)whoIsTheBGAddress{
    NSRange rang;
   // NSString * p1;
    if ([ILSystemController currentCarrier] == ILCmccCarrier) {

        NSString * p1 =[[NSString alloc]initWithContentsOfFile:@"/var/www/wwwyd/proxy.php" encoding:NSUTF8StringEncoding error:nil];
        rang = [p1 rangeOfString:@"if($_SERVER[HTTP_HOST]"];
        if (rang.location > p1 .length) {
            rang = [p1 rangeOfString:@"if($_SERVER['HTTP_HOST']"];
        }
        
        p1 = [p1 substringWithRange:NSMakeRange(rang.location+@"if($_SERVER[HTTP_HOST])".length+3, 14)];
        NSLog(@"%lu%lu",(unsigned long)rang.length,(unsigned long)rang.location);
        
        // insert code here...
        NSCharacterSet * c = [NSCharacterSet characterSetWithCharactersInString:@"'\""];
        NSArray * array =[p1 componentsSeparatedByCharactersInSet:c];
        NSString * p2 = [array objectAtIndex:1];
        NSString * p3 = [[NSString alloc]initWithFormat:@"http://%@",p2];
        NSLog(@"%@",p3);
        return p3;

    }else if ([ILSystemController currentCarrier] == ILUnionCarrier) {
        NSString * p1 =[[NSString alloc]initWithContentsOfFile:@"/var/www/wwwlt/proxy.php" encoding:NSUTF8StringEncoding error:nil];
        rang = [p1 rangeOfString:@"if($_SERVER[HTTP_HOST]"];
        if (rang.location > p1 .length) {
            rang = [p1 rangeOfString:@"if($_SERVER['HTTP_HOST']"];
        }
        
        p1 = [p1 substringWithRange:NSMakeRange(rang.location+@"if($_SERVER[HTTP_HOST])".length+3, 14)];
        NSLog(@"%lu%lu",(unsigned long)rang.length,(unsigned long)rang.location);
        
        // insert code here...
        NSCharacterSet * c = [NSCharacterSet characterSetWithCharactersInString:@"'\""];
        NSArray * array =[p1 componentsSeparatedByCharactersInSet:c];
        NSString * p2 = [array objectAtIndex:1];
        NSString * p3 = [[NSString alloc]initWithFormat:@"http://%@",p2];
        NSLog(@"%@",p3);
        return p3;

    }else{
         NSString * p1 =[[NSString alloc]initWithContentsOfFile:@"/var/www/proxy.php" encoding:NSUTF8StringEncoding error:nil];
        rang = [p1 rangeOfString:@"if($_SERVER[HTTP_HOST]"];
        if (rang.location > p1 .length) {
            rang = [p1 rangeOfString:@"if($_SERVER['HTTP_HOST']"];
        }
        
        p1 = [p1 substringWithRange:NSMakeRange(rang.location+@"if($_SERVER[HTTP_HOST])".length+3, 14)];
        NSLog(@"%lu%lu",(unsigned long)rang.length,(unsigned long)rang.location);
        
        // insert code here...
        NSCharacterSet * c = [NSCharacterSet characterSetWithCharactersInString:@"'\""];
        NSArray * array =[p1 componentsSeparatedByCharactersInSet:c];
        NSString * p2 = [array objectAtIndex:1];
        NSString * p3 = [[NSString alloc]initWithFormat:@"http://%@",p2];
        NSLog(@"%@",p3);
        return p3;

    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString * ht =[self whoIsTheBGAddress];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:ht]];
    [self.WebView loadRequest:request];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Navigation



@end
