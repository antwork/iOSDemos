//
//  RingRunner.m
//  ProxyDemo
//
//  Created by lunkr on 2021/3/2.
//

#import "RingRunner.h"
#import "Ringer.h"
#import "Runner.h"
#import <objc/runtime.h>

@interface RingRunner()

@property (nonatomic, strong) Ringer *ringer;
@property (nonatomic, strong) Runner *runner;
@end

@implementation RingRunner


+ (instancetype)runner {
    return [[RingRunner alloc] init];
}

- (instancetype)init {
    _ringer = [[Ringer alloc] init];
    _runner = [[Runner alloc] init];
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.ringer respondsToSelector:aSelector]) {
        return self.ringer;
    } else if ([self.runner respondsToSelector:aSelector]) {
        return self.runner;
    }
    
    return self;
}

@end
