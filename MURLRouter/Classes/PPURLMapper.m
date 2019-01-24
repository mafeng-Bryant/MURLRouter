//
//  PPURLActions.m
//  PatPat
//
//  Created by Bruce He on 15/8/17.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPURLMapper.h"
#import "PPURLActions.h"
#import "PPURLSelectors.h"
#import "PPURLRouter+NSString.h"

NSString * const PPURLParameterKeyAction  = @"action";

@implementation PPURLMapper

//Action与Selector映射
+ (NSDictionary *)actionMaps
{
    return @{
             PPURLActionShowLogin     :  PPURLSelectorShowLogin,        //show login page
             PPURLActionShowRegister  :  PPURLSelectorShowRegister,     //show register
             PPURLActionProductDetail :  PPURLSelectorProductDetail,    //go to product detail
             PPURLActionEventDetail   :  PPURLSelectorEventDetail,      //go to event detail
             PPURLActionBundleSaleEventDetail   :  PPURLSelectorBundleSaleEventDetail,     //go to bundlesale event detail
             PPURLActionWallet        :  PPURLSelectorWallet,           //go to wallet
             PPURLActionFaves         :  PPURLSelectorFaves,            //go to Faves
             PPURLActionShoppingCart  :  PPURLSelectorShoppingCart,     //go to shopping cart
             PPURLActionOrders        :  PPURLSelectorOrders,           //go to orders
             PPURLActionOrderDetail   :  PPURLSelectorOrderDetail,      //go to order detail
             PPURLActionWebPage       :  PPURLSelectorWebPage,          //go to web page
             PPURLActionTel           :  PPURLSelectorTel,              //call up
             PPURLActionEmail         :  PPURLSelectorEmail,            //send email
             PPURLActionSMS           :  PPURLSelectorSMS,              //send SMS
             PPURLActionCategory      :  PPURLSelectorCategory,         //set current category
             PPURLActionShare         :  PPURLSelectorShare,            //share
             PPURLActionClearance     :  PPURLSelectorClearance,        //clearance
             PPURLActionFreebie       :  PPURLSelectorFreebie,          //freebie
             PPURLActionAppStore      :  PPURLSelectorOpenAppStore,     //open appstore
             PPURLActionViewAllItems  :  PPURLSelectorViewAllItems,       //view all items
             PPURLActionLifeDetail    :  PPURLSelectorLifeDetail,
             PPURLActionShareLifeDetail:PPURLSelectorShareLifeDetail,
             PPURLActionFlashSaleEventList :PPURLSelectorFlashSaleEventList,
             PPURLActionCategoryDetail     :PPURLSelectorCategoryDetail,
             PPURLActionNewArrivalDetail   :PPURLSelectorNewArrivalDetail,
             PPURLActionOrderConfirmPage   :PPURLSelectorOrderConfirmPage,
             PPURLActionOrderFailUrePage   :PPURLSelectorOrderFailUrePage,
             PPURLActionOrderCancelPage    :PPURLSelectorOrderCancelPage,
             PPURLActionShopCartCancelPage :PPURLSelectorShopCartCancelPage,
             PPURLActionCheckoutPage       :PPURLSelectorCheckoutPage,
             PPURLActionGoShoppingNow  :  PPURLSelectorJumpHomePage,
             PPURLActionPresentContactUs  :  PPURLSelectorPresentContactUs,
             PPURLActionInviteFriend : PPURLSelectorInviteFriend,
             PPURLActionFeedback : PPURLSelectorFeedback,
             PPURLActionMemberShip : PPURLSelectorMemberShip,
             PPURLActionNewUserOnly : PPURLSelectorShareForFreeList,
             PPURLActionOrderList : PPURLSelectorCheckOrderList,
             PPURLActionReWards : PPURLSelectorReWardsList,
             PPURLActionPostLife : PPURLSelectorPostLife,
             PPURLActionPostLifeAccount : PPURLSelectorPostLifeAccount
             };
}


+ (BOOL)checkAuth:(NSString *)url
{
    if (url.length > 0) {
        NSString *action = [url valueForParameter:PPURLParameterKeyAction];//get action
        if (action.length > 0) {
            if ([[self shouldLoginActions] containsObject:action]) {
                return NO;
            }
        }
    }
    return YES;
}


#pragma mark private methords

+ (NSArray *)shouldLoginActions
{
    return @[PPURLActionWallet,
             PPURLActionOrderDetail
             ];
}


@end
