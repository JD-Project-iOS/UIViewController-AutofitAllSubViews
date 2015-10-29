//
//  UIViewController+AutofitAllSubViews.m
//  AutoFit
//
//  Created by CHD on 15/10/27.
//  Copyright © 2015年 1. All rights reserved.
//

#import "UIViewController+AutofitAllSubViews.h"
NSString *const CHDIphone5=@"CHDIphone5";
NSString *const CHDIphone6=@"CHDIphone6";
@implementation UIViewController (AutofitAllSubViews)

//另:此方法只是对frame进行等比缩放，建议在比较简单页面中使用。不建议大量使用。  该方法的本质就是根据当前屏幕比例，找到传入view的所有的子view(包括子view的子view)进行frame的改变。 最终效果类似苹果的放大模式，但是由于是对frame的改变，不会导致发虚。
- (void)autoFitFrameWithSuper:(UIView *)superView baseOn:(NSString *)device
{    
    static float Xchange = 1.0;
    static float Ychange = 1.0;
    static BOOL isFirst = YES;
    
    //NSLog(@"%@",NSStringFromCGRect(superView.frame));
    //NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    //用于存储所有的子view
    static  NSMutableArray *allArr;
    
    //计算比例，只算一次
    if (isFirst) {
        if (device == CHDIphone5) {
            Xchange = [UIScreen mainScreen].bounds.size.width /320.0;
            Ychange = [UIScreen mainScreen].bounds.size.height/568.0;
        }else if (device == CHDIphone6){
            Xchange = [UIScreen mainScreen].bounds.size.width /375.0;
            Ychange = [UIScreen mainScreen].bounds.size.height/667.0;
        }
        allArr = [NSMutableArray array];
        isFirst = NO;
    }
    
    //用于存储当前父view下的子view还拥有子view的view
    NSMutableArray *subViewArr = [NSMutableArray arrayWithCapacity:0];
    NSLog(@"适配的子view个数%d",(int)superView.subviews.count);
    //根据比例对所有子view进行适配并保存需要的子view
    for (UIView *subView in superView.subviews) {
        subView.frame = CGRectMake(subView.frame.origin.x *Xchange, subView.frame.origin.y * Ychange, subView.frame.size.width * Xchange, subView.frame.size.height * Ychange);
        if (subView.subviews.count) {
            [subViewArr addObject:subView];
        }
    }
    //添加到大叔组
    [allArr addObject:subViewArr];
    //查找该父view是否已经适配子view，适配后删除。否则将递归无线循环
    for (int j =0; j<allArr.count; j ++) {
        NSMutableArray *srr = allArr[j];
        for (int k =0; k<srr.count; k ++) {
            if ([srr containsObject:superView]) {
                [srr removeObject:superView];
            }
        }
    }
    //进行子view的子view的适配，直至到没有子view
    for (int j=0;j<allArr.count;j++) {
        NSMutableArray *arr = allArr[j];
        for (int i=0; i < arr.count;i++) {
            UIView *view = arr[i];
            [self autoFitFrameWithSuper:view baseOn:device];
            
        }
    }
    //清空
    isFirst = YES;
    [allArr removeAllObjects];
}
@end
