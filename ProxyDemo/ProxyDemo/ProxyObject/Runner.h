//
//  Runner.h
//  ProxyDemo
//
//  Created by lunkr on 2021/3/2.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface Runner : NSObject<Runnable>

- (void)move;

@end

NS_ASSUME_NONNULL_END
