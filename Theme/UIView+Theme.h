//
//  UIView+Theme.h
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface UIView (Theme)

@property (nonatomic, copy) NSString *theme_backgroundColor;
@property (nonatomic, copy) IBInspectable NSString *hq_backgroundColor;
@property (nonatomic, copy) NSString *theme_tintColor;


@end
