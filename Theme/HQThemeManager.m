//
//  HQThemeManager.m
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "HQThemeManager.h"

NSString * const HQThemeChangedNotification = @"HQThemeChangedNotification";
NSString * const kLastTheme = @"kLastTheme";

@interface HQThemeManager()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSArray *themeArray;
@property (nonatomic, assign) NSInteger currentThemeIndex;

@end

@implementation HQThemeManager

+ (instancetype)manager {
    static HQThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HQThemeManager alloc] init];
    });
    return manager;
}

- (void)setupThemeNameArray:(NSArray *)array {
    self.themeArray = array;
    if (array.count > self.currentThemeIndex) {
        self.bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:[array objectAtIndex:self.currentThemeIndex] withExtension:@"bundle"]];
    } else {
        self.bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:array[0] withExtension:@"bundle"]];
    }
}

- (void)changeTheme {
    self.currentThemeIndex = !self.currentThemeIndex;
    self.bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:self.themeArray[self.currentThemeIndex] withExtension:@"bundle"]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:HQThemeChangedNotification object:nil];
}

- (UIColor *)colorWithColorId:(NSString *)colorId {
    UIColor *color = [UIColor colorNamed:colorId inBundle:self.bundle compatibleWithTraitCollection:nil];
    return color;
}

- (NSInteger)currentThemeIndex {
    return [[NSUserDefaults standardUserDefaults] integerForKey:kLastTheme];

}

- (void)setCurrentThemeIndex:(NSInteger)currentThemeIndex {
    currentThemeIndex = currentThemeIndex;
    
    [[NSUserDefaults standardUserDefaults] setInteger:currentThemeIndex forKey:kLastTheme];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
