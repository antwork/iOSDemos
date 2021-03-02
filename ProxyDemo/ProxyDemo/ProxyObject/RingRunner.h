//
//  RingRunner.h
//  ProxyDemo
//
//  Created by lunkr on 2021/3/2.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface RingRunner : NSProxy <Runnable, Ringable>

+ (instancetype)runner;

@end

NS_ASSUME_NONNULL_END
