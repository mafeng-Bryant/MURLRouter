//
//  PPURLRouter+NSString.m
//  PatPat
//
//  Created by Bruce He on 15/8/17.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPURLRouter+NSString.h"

@implementation NSString(PPURLRouter_NSString)

- (BOOL)isValidScheme
{
    return [self hasPrefix:@"patpat://"];
}

- (NSString *)valueForParameter:(NSString *)parameter
{
    if (parameter.length > 0) {
        return [self urlValueForParameter:parameter];
    }
    return nil;
}

- (NSString*)webValueForParameter:(NSString *)parameter
{
    if (parameter.length > 0) {
        return [self urlwebValueForParameter:parameter];
    }
    return nil;
}

- (NSString *)urlValueForParameter:(NSString *)parameter
{
    if (![parameter hasSuffix:@"="])
    {
        parameter = [NSString stringWithFormat:@"%@=", parameter];
    }
    NSString * str = nil;
    NSRange start = [self rangeOfString:parameter];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [self characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {
            if ([[parameter lowercaseString] isEqualToString:@"url="] ) {
                str = [self substringFromIndex:start.location+start.length];
            }else {
                // confirm that the parameter is not a partial name match
                unichar c = '?';
                if (start.location != 0)
                {
                    c = [self characterAtIndex:start.location - 1];
                }
                if (c == '?' || c == '&' || c == '#')
                {
                    NSRange end = [[self substringFromIndex:start.location+start.length] rangeOfString:@"&"];
                    NSUInteger offset = start.location+start.length;
                    str = (end.location == NSNotFound) ?([self substringFromIndex:offset]):([self substringWithRange:NSMakeRange(offset, end.location)]);
                    if ((![parameter isEqualToString:@"title="]) && (![parameter isEqualToString:@"error_info="]) && (![parameter isEqualToString:@"subject="]) && (![parameter isEqualToString:@"content="])) {
                        str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                    }
                }
            }
        }
    }
    return str;
}

- (NSString *)urlwebValueForParameter:(NSString *)parameter
{
    if (![parameter hasSuffix:@"="])
    {
        parameter = [NSString stringWithFormat:@"%@=", parameter];
    }
    
    NSString * str = nil;
    NSRange start = [self rangeOfString:parameter];
    if (start.location != NSNotFound)
    {
        // confirm that the parameter is not a partial name match
        unichar c = '?';
        if (start.location != 0)
        {
            c = [self characterAtIndex:start.location - 1];
        }
        if (c == '?' || c == '&' || c == '#')
        {
            // NSRange end = [[self substringFromIndex:start.location+start.length] rangeOfString:@"&"];
            NSUInteger offset = start.location+start.length;
            str = [self substringFromIndex:offset];
            //            str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
    }
    return str;
}

@end
