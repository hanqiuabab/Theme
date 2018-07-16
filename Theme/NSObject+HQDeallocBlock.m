//
//  NSObject+HQDeallocBlock.m
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "NSObject+HQDeallocBlock.h"
#import <objc/runtime.h>

const void *HQDeallocExecutorsKey = &HQDeallocExecutorsKey;

@interface HQDeallocExcutor:NSObject
@property (nonatomic, copy) void (^deallocBlock)(void);
@end

@implementation HQDeallocExcutor

- (id)initWithDeallocBlock:(void(^)(void))block {
    self = [super init];
    if (self) {
        self.deallocBlock = block;
    }
    return self;
}

- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
    }
}
@end

@implementation NSObject (HQDeallocBlock)

- (void)hq_executeAtDealloc:(void(^)(void))block {
    if (block) {
        HQDeallocExcutor *executor = [[HQDeallocExcutor alloc] initWithDeallocBlock:block];
        @synchronized (self) {
            [[self hs_deallocExecutors] addObject:executor];
        }
    }
}

- (NSHashTable *)hs_deallocExecutors {
    NSHashTable *table = objc_getAssociatedObject(self, HQDeallocExecutorsKey);
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, HQDeallocExecutorsKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    return table;
}
@end
