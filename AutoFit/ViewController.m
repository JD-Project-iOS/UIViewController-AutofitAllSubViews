//
//  ViewController.m
//  AutoFit
//
//  Created by CHD on 15/4/11.
//  Copyright (c) 2015年 1. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AutofitAllSubViews.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    /*
        创建ui的代码只需要固定各个view的frame，必须针对iphone5或iphone6写了一套已经适配的frame
     
        demo中的xib针对iphone5做了固定的适配。
     */
    
    //界面搭建完成后，此处动态展示适配。实际中直接调用即可。
    [UIView animateWithDuration:5 animations:^{
       [self autoFitFrameWithSuper:self.view baseOn:CHDIphone5];
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
