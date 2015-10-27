//
//  UIViewController+AutofitAllSubViews.h
//  AutoFit
//
//  Created by CHD on 15/10/27.
//  Copyright © 2015年 1. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const CHDIphone5;
extern NSString *const CHDIphone6;
@interface UIViewController (AutofitAllSubViews)
//superview传self.vew即可。  设备参数指当前 你搭建的UI固定的适配了哪个设备，适配了谁就传谁。
//重点：
//使用xib或sb时不能使用autoLayout,若使用autosizing只勾选左上两个方向。
//在几寸屏基础下改变，必须保证在几寸屏时是对的。其他屏将进行等比例拉伸。

//另:此方法只是对frame进行等比缩放，建议在比较简单页面中使用。不建议大量使用。  在viewdidload完毕后调用即可。
- (void)autoFitFrameWithSuper:(UIView*)superView baseOn:(NSString*)device;
@end
