//
//  ViewController.m
//  KVODemo
//
//  Created by qxu on 2021/2/26.
//

#import "ViewController.h"
#import "Person.h"
#import "KVOArray.h"
@interface ViewController ()

// 1. 声明属性
@property (strong, nonatomic) Person *person;

@property (strong, nonatomic) KVOArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[Person alloc] init];
    
    self.array = [[KVOArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 2. 开始监听
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.array addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 4.结束监听
    [self.person removeObserver:self forKeyPath:@"name"];
    [self.array removeObserver:self forKeyPath:@"array"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.person && [keyPath isEqualToString:@"name"]) {
        NSString *oldValue = change[NSKeyValueChangeOldKey];
        NSString *newValue = change[NSKeyValueChangeNewKey];
        NSLog(@"更新名字:%@ -> %@", oldValue, newValue);
    } else if (object == self.array && [keyPath isEqualToString:@"array"]) {
        NSString *oldValue = change[NSKeyValueChangeOldKey];
        NSString *newValue = change[NSKeyValueChangeNewKey];
        
        NSIndexSet *changedIndexs = change[NSKeyValueChangeIndexesKey];
        NSLog(@"array:%p", self.array.array);
        NSLog(@"更新数组:%@ -> %@: %@", oldValue, newValue, changedIndexs);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (IBAction)changeName:(id)sender {
    // 触发kvo, 输出: 更新名字:.. -> 小王
    [self.person changeNameWithDot:@"小王"];
}

- (IBAction)changeDashName:(id)sender {
    // 不触发kvo
    [self.person changeNameWithDash:@"小王"];
}

- (IBAction)changeDashNameWithKVO:(id)sender {
    // 触发kvo, 输出: 更新名字:.. -> 小王
    [self.person changeNameWithDashAndKVO:@"小王"];
}

- (IBAction)plusBtnClicked:(id)sender {
    [self.array addObjectsFromArray:@[@"1", @"2", @"3"]];
}

- (IBAction)minusBtnClicked:(id)sender {
    [self.array removeLastObject];
}

@end
