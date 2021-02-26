//
//  Person.m
//  KVODemo
//
//  Created by qxu on 2021/2/26.
//  Copyright © 2021 ziu. All rights reserved.
//

#import "Person.h"

@implementation Person

// 使用点更新名字
- (void)changeNameWithDot:(NSString *)aName {
    self.name = aName;
}

// 使用下横线更新名字
- (void)changeNameWithDash:(NSString *)aName {
    _name = aName;
}

// 使用下横线更新名字且添加KVO
- (void)changeNameWithDashAndKVO:(NSString *)aName {
    [self willChangeValueForKey:@"name"];
    
    _name = aName;
    [self didChangeValueForKey:@"name"];
}

@end
