//
//  Protocols.h
//  ProxyDemo
//
//  Created by lunkr on 2021/3/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Runnable <NSObject>

- (void)move;

@end

@protocol Ringable <NSObject>

- (void)dingding;

@end

NS_ASSUME_NONNULL_END
