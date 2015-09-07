//
//  NewClockViewController.m
//  ReadBoyClassTable
//
//  Created by 廖京辉 on 15/9/5.
//  Copyright (c) 2015年 廖京辉. All rights reserved.
//

#import "NewClockViewController.h"
#define WIDTH self.SettingArea.bounds.size.width
@interface NewClockViewController ()

@end

@implementation NewClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self DrawLines];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)DrawLines{
    
    UIView *line0 =[[UIView alloc]initWithFrame:CGRectMake(10, 61, WIDTH+30, 1)];
    line0.backgroundColor =[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];
    [self.SettingArea addSubview:line0];
    
    UIView *line1 =[[UIView alloc]initWithFrame:CGRectMake(10, 121, WIDTH+30, 1)];
    line1.backgroundColor =[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];
    [self.SettingArea addSubview:line1];
       
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
