//
//  Person.h
//  KVODemo
//
//  Created by qxu on 2021/2/26.
//  Copyright © 2021 ziu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic, strong) NSString *name;

// 使用点更新名字
- (void)changeNameWithDot:(NSString *)aName;

// 使用下横线更新名字
- (void)changeNameWithDash:(NSString *)aName;

// 使用下横线更新名字且添加KVO
- (void)changeNameWithDashAndKVO:(NSString *)aName;

@end

NS_ASSUME_NONNULL_END
