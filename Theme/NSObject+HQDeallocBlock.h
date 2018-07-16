//
//  NSObject+HQDeallocBlock.h
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HQDeallocBlock)
- (void)hq_executeAtDealloc:(void(^)(void))block;
@end
