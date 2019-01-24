//
//  PPURLRouter+NSObject.m
//  PatPat
//
//  Created by Bruce He on 15/8/17.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPURLRouter+NSObject.h"

@implementation NSObject(PPURLRouter_NSObject)

- (UIViewController *)currentVisibleViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (UIViewController *)rootViewController
{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

@end
