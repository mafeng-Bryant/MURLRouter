//
//  PPURLActions.h
//  PatPat
//
//  Created by Bruce He on 15/8/17.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 //URL格式统一为patpat://开头，例如
 "patpat://?action=product_detail&event_id=1&product_id=1&user_id=3"
 "patpat://?action=order_detail&order_id=3696"
 */

extern NSString * const PPURLParameterKeyAction;

@interface PPURLMapper : NSObject

+ (NSDictionary *)actionMaps;

+ (BOOL)checkAuth:(NSString *)url;

@end
