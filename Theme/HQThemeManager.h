//
//  HQThemeManager.h
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const HQThemeChangedNotification;

@interface HQThemeManager : NSObject

+ (instancetype)manager;

- (void)setupThemeNameArray:(NSArray *)array;
- (void)changeTheme;

- (UIColor *)colorWithColorId:(NSString *)colorId;
@end
