//
//  PPURLHandler.m
//  PatPat
//
//  Created by Yuan on 15/2/14.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPURLRouter.h"
#import "PPURLRouter+NSString.h"
#import "PPURLMapper.h"

#define MSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation PPURLRouter

- (id)initWithUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

#pragma mark Public methords

+ (NSString *)actionWithUrl:(NSString *)url
{
    if (url.length > 0 && [url isValidScheme]) {
        return [url valueForParameter:PPURLParameterKeyAction];
    }
    return nil;
}

+ (BOOL)isValidExecute:(NSString *)url
{
    if (url.length > 0 && [url isValidScheme] && [PPURLMapper checkAuth:url]) {//要求登录后才能处理的必须要先登录
        NSString *action = [url valueForParameter:PPURLParameterKeyAction];//get action
        if (action.length > 0) {
            NSString *strSelector = [PPURLMapper actionMaps][action]; //get selector by action
            if (strSelector.length > 0) {
                return YES;
            }
        }
    }
    return NO;
}

+(void)executeWithUrl:(NSString *)url
{
    if (url.length > 0 && [url isValidScheme] && [PPURLMapper checkAuth:url]) {
        NSString *action = [url urlValueForParameter:PPURLParameterKeyAction];//get action
        if (action.length > 0) {
            NSString *strSelector = [PPURLMapper actionMaps][action]; //get selector by action
            if (strSelector.length > 0) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    while (![PPURLMapper checkAuth:url]){
                        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        SEL selector = NSSelectorFromString(strSelector);
                        if (selector){
                            PPURLRouter *handler = [[PPURLRouter alloc]initWithUrl:url];
                            if (selector && [handler respondsToSelector:selector]) {
                                MSuppressPerformSelectorLeakWarning([handler performSelector:selector]);
                            }
                        }
                    });
                });
            }
        }
    }
}

+ (BOOL)isWebPage:(NSString*)url
{
    if (url.length > 0) {
        NSString *action = [url urlValueForParameter:PPURLParameterKeyAction];//get action
        if ([action isEqualToString:@"webpage"]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
