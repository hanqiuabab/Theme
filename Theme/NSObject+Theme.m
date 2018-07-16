//
//  NSObject+Theme.m
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "NSObject+Theme.h"
#import "NSObject+HQDeallocBlock.h"
#import <objc/runtime.h>
#import "HQThemeManager.h"

static NSString *const kHasRegistChangedThemeNotification;

@interface NSObject()

@property (nonatomic, copy) void(^themeChangeBlock)(id);
@end

@implementation NSObject (Theme)

- (void)theme_registChangedNotification {
    NSNumber *hasRegist = objc_getAssociatedObject(self, &kHasRegistChangedThemeNotification);
    if (hasRegist) {
        return;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(theme_didChanged) name:HQThemeChangedNotification object:nil];
    
    objc_setAssociatedObject(self, &kHasRegistChangedThemeNotification, @(YES), OBJC_ASSOCIATION_COPY_NONATOMIC);
    __weak typeof(self) weakSelf = self;
    [self hq_executeAtDealloc:^{
        [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
    }];
}

- (void)theme_observerChanged:(void (^)(id))themeChangeBlock {
    self.themeChangeBlock = themeChangeBlock;
    [self theme_didChanged];
    [self theme_registChangedNotification];
}

- (void)theme_didChanged {
    if (self.themeChangeBlock) {
        __weak typeof(self) weakSelf = self;
        self.themeChangeBlock(weakSelf);
    }
}

- (void)setThemeChangeBlock:(void (^)(id))themeChangeBlock {
    objc_setAssociatedObject(self, @selector(theme_didChanged), themeChangeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(id))themeChangeBlock {
    return objc_getAssociatedObject(self, @selector(theme_didChanged));
}
@end
