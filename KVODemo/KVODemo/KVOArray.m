//
//  KVOArray.m
//  KVODemo
//
//  Created by qxu on 2021/2/26.
//  Copyright © 2021 ziu. All rights reserved.
//

#import "KVOArray.h"

@interface KVOArray()

@property (strong, nonatomic, readwrite) NSMutableArray *array;

@end

@implementation KVOArray

- (instancetype)init {
    if (self = [super init]) {
        self.array = [NSMutableArray array];
    }
    
    return self;
}

- (void)addObject:(id)anObject {
    [[self kvoArray] addObject:anObject];
}

- (void)addObjectsFromArray:(NSArray *)objects {
    [[self kvoArray] addObjectsFromArray:objects];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [[self kvoArray] insertObject:anObject atIndex:index];
}

- (void)removeLastObject {
    [[self kvoArray] removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [[self kvoArray] removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [[self kvoArray] replaceObjectAtIndex:index withObject:anObject];
}

- (NSMutableArray *)kvoArray {
    NSMutableArray *result = [self mutableArrayValueForKey:@"array"];
    NSLog(@"kvoArray: %p", result);
    return  result;
}

@end
