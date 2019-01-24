//
//  PPURLRouter+NSString.h
//  PatPat
//
//  Created by Bruce He on 15/8/17.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(PPURLRouter_NSString)

- (BOOL)isValidScheme;

- (NSString *)valueForParameter:(NSString *)parameter;

- (NSString*)webValueForParameter:(NSString *)parameter;

- (NSString *)urlValueForParameter:(NSString *)parameter;

- (NSString *)urlwebValueForParameter:(NSString *)parameter;


@end
