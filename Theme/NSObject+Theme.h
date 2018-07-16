//
//  NSObject+Theme.h
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Theme)

- (void)theme_registChangedNotification;
- (void)theme_observerChanged:(void(^)(id observer))themeChangeBlock;
- (void)theme_didChanged;
@end
