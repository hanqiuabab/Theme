//
//  UIView+Theme.m
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "UIView+Theme.h"
#import <objc/runtime.h>
#import "HQThemeManager.h"
#import "NSObject+Theme.h"

@implementation UIView (Theme)

- (void)setTheme_backgroundColor:(NSString *)theme_backgroundColor {
    self.backgroundColor = [[HQThemeManager manager] colorWithColorId:theme_backgroundColor];
    objc_setAssociatedObject(self, @selector(theme_backgroundColor), theme_backgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self theme_registChangedNotification];
}

- (NSString *)theme_backgroundColor {
    return objc_getAssociatedObject(self, @selector(theme_backgroundColor));
}

- (NSString *)hq_backgroundColor {
    return objc_getAssociatedObject(self, @selector(hq_backgroundColor));
}

- (void)setHq_backgroundColor:(NSString *)hq_backgroundColor {
    self.theme_backgroundColor = hq_backgroundColor;
}


- (NSString *)theme_tintColor {
    return objc_getAssociatedObject(self, @selector(theme_tintColor));
}

- (void)setTheme_tintColor:(NSString *)theme_tintColor {
    self.tintColor = [[HQThemeManager manager] colorWithColorId:theme_tintColor];
    objc_setAssociatedObject(self, @selector(theme_tintColor), theme_tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_backgroundColor) {
        self.backgroundColor = [[HQThemeManager manager] colorWithColorId:self.theme_backgroundColor];
    }
    if (self.theme_tintColor) {
        self.tintColor = [[HQThemeManager manager] colorWithColorId:self.theme_tintColor];
    }
}
@end
