//
//  QYViewController.m
//  ThreadDemo
//
//  Created by qingyun on 14-7-17.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

int gInt = 0;
@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}
- (IBAction)onButtonTapped:(UIButton *)sender {
//    [self doThing:@"hello"];
    
//    [self performSelectorInBackground:@selector(doThing:) withObject:@"HelloQing"];
    
//    [NSThread detachNewThreadSelector:@selector(doThing:) toTarget:self withObject:@"hello"];
    
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(doThing:) object:@"Hello"];
//    thread.name = @"FirstQingYunThread";
//    [thread start];
    
 
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doThing:) object:@"HelloOperationQueue"];
//    [queue addOperation:operation];
//    [queue addOperation:operation];
#if 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *oper = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"do thing...");
        gInt++;
        NSThread *currentThread = [NSThread currentThread];
        
        if ([currentThread isMainThread]) {
            NSLog(@"Main thread...%d", gInt);
        } else {
            NSLog(@"peer thread...%d", gInt);
        }
        [NSThread sleepForTimeInterval:10];
        NSLog(@"finish doThing");
    }];
    [queue addOperation:oper];
    
#endif
#if 0
    dispatch_queue_t queue = dispatch_queue_create("com.hnqingyun.queue", NULL);
    
    dispatch_async(queue, ^{
        NSLog(@"gcd do thing...");
        gInt++;
        NSThread *curretnhread = [NSThread currentThread];
        if ([curretnhread isMainThread]) {
            NSLog(@"Main Thread ...%d", gInt);
        } else {
            NSLog(@"peer Thread ...%d", gInt);
        }
        [NSThread sleepForTimeInterval:5];
        NSLog(@"finish doThing");
    });
    
    dispatch_queue_t secondQueue = dispatch_queue_create("com.hnqingyun.secondQueue", NULL);
    dispatch_async(secondQueue, ^{
        NSLog(@"second queue gcd do thing");
        gInt++;
        NSThread *currentThread = [NSThread currentThread];
        if ([currentThread isMainThread]) {
            NSLog(@"second Main thread ...%d", gInt);
        } else {
            NSLog(@"second peer thread ...%d", gInt);
        }
        [NSThread sleepForTimeInterval:5];
        NSLog(@"second finish do thing ");
    });
#endif
#if 0
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"first do thing...");
        gInt++;
        NSThread *currentThread = [NSThread currentThread];
        if ([currentThread isMainThread]) {
            NSLog(@"first is main thread...");
        } else {
            NSLog(@"first is peer thread...");
        }
        [NSThread sleepForTimeInterval:5];
        NSLog(@"first finish");
    });
    
    dispatch_queue_t secondQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(secondQueue, ^{
        NSLog(@"second do thing...");
        gInt++;
        NSThread *currentThread = [NSThread currentThread];
        if ([currentThread isMainThread]) {
            NSLog(@"second is main thread");
        } else {
            NSLog(@"second is peer thread");
        }
        NSLog(@"second finished");
    });
    NSLog(@"button dosome thing Done");
#endif
}

- (void)doThing:(id)object
{
    NSLog(@"do thing...:%@", object);
    gInt++;
    NSThread *currentThread = [NSThread currentThread];
    if ([currentThread isMainThread]) {
        NSLog(@"Main thread...%d", gInt);
    } else {
        NSLog(@"Peer thread...%d", gInt);
    }
    [NSThread sleepForTimeInterval:10];
    NSLog(@"finish doThing");
}
- (IBAction)doAnotherThing:(UIButton *)sender {
    NSLog(@"do another thing .....");
    if ([NSThread isMainThread]) {
        NSLog(@"do another thing is main thread");
    } else {
        NSLog(@"do another thing is peer thread");
    }
    [NSThread sleepForTimeInterval:3];
    NSLog(@"another thing finished");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
