//
//  HYConstDefine.h
//  HYWeiBoDemo
//
//  Created by qingyun on 14-7-24.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#ifndef HYWeiBoDemo_HYConstDefine_h
#define HYWeiBoDemo_HYConstDefine_h

#define kAppKey                 @"4246590151"
#define kAppSecret              @"592f1a3b81551c341a713bf8b696b9f1"
#define kAppRedirectURI         @"https://api.weibo.com/oauth2/default.html"


#define kEverLaunched           @"everLaunched"
#define kFirstLaunched          @"firstLaunched"



#define kAuthDataKey            @"SinaWeiboAuthData"
#define kAuthAccessTokenKey     @"AccessTokenKey"
#define kAuthUserIDKey          @"UserIDKey"
#define kAuthExpirationDateKey  @"ExpirationDateKey"
#define kAuthRefreshTokenKey    @"refreshToken"

#define NSUD [NSUserDefaults standardUserDefaults]

#define AppDelegate ((QYAppDelegate *)[UIApplication sharedApplication].delegate)

#define safeRelease (_pointer) {[_pointer release], _pointer = nil;}

#endif
