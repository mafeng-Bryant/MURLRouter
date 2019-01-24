//
//  PPURLHandler.h
//  PatPat
//
//  Created by Yuan on 15/2/14.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline NSString *PatPatUrl(NSString *action,NSDictionary *vars)
{
    NSString *url = [NSString stringWithFormat:@"patpat://?action=%@",action];
   __block NSString *varString = @"";
    [vars.allKeys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        NSString *var = [NSString stringWithFormat:@"%@=%@",key,vars[key]];
        varString = [varString stringByAppendingFormat:@"&%@",var];
    }];
    if (varString.length > 0) {
        NSString *finalUrl = [url stringByAppendingFormat:@"&%@",varString];
        return finalUrl;
    }
    return url;
}

@interface PPURLRouter : NSObject
{
    NSString * _url;
}

+(void)executeWithUrl:(NSString *)url;

+ (BOOL)isValidExecute:(NSString *)url;

+ (NSString *)actionWithUrl:(NSString *)url;

+ (BOOL)isWebPage:(NSString*)url;

@end
