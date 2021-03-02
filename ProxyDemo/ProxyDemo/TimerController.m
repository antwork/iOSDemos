//
//  TimerController.m
//  OCDemo1
//
//  Created by qxu on 2021/3/2.
//

#import "TimerController.h"

@interface XProxy : NSProxy

@property (weak, nonatomic) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

@implementation XProxy

+ (instancetype)proxyWithTarget:(id)target {
    XProxy *proxy = [XProxy alloc];
    proxy.target = target;
    
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (self.target) {
        return self.target;
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end

@interface TimerController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation TimerController

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"isKindOfClass == %d",[[XProxy proxyWithTarget:self] isKindOfClass:[self class]]);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:[XProxy proxyWithTarget:self]
                                                    selector:@selector(testForTimer)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)testForTimer {
    NSLog(@"%s",__func__);
}

@end
