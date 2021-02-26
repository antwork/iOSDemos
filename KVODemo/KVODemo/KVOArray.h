//
//  KVOArray.h
//  KVODemo
//
//  Created by qxu on 2021/2/26.
//  Copyright © 2021 ziu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOArray : NSObject

@property (strong, nonatomic, readonly) NSMutableArray *array;

- (void)addObject:(id)anObject;

- (void)addObjectsFromArray:(NSArray *)objects;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)removeLastObject;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

NS_ASSUME_NONNULL_END
