//
//  ViewController.m
//  ProxyDemo
//
//  Created by qxu on 2021/3/2.
//

#import "ViewController.h"
#import "TimerController.h"
#import "RingRunner.h"
#import "Ringer.h"
#import "Runner.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RingRunner *ringRunner = [RingRunner runner];
    
    [ringRunner move];
    [ringRunner dingding];
}

- (IBAction)timerClicked:(id)sender {
    TimerController *controller = [[TimerController alloc] initWithNibName:@"TimerController" bundle:nil];
    [self.navigationController pushViewController:controller animated:true];
}


@end
