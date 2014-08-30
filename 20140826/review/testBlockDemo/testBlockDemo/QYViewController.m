//
//  QYViewController.m
//  testBlockDemo
//
//  Created by qingyun on 14-8-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYTestViewController.h"

typedef void (^blockCC)(void);
typedef long (^BlkSum)(int, int);

@interface QYViewController ()

@property (nonatomic, copy) blockCC testBlock;
@property (nonatomic, copy) blockCC testBlc;

@property (nonatomic, retain) NSString *str;

@end

@implementation QYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

blockCC blockDemo = ^{
    NSLog(@"ssss");
};

- (void)viewDidLoad
{
    [super viewDidLoad];
    blockDemo();
    __block int testNumber = 1;
    int testNumberTwo = 2;
    
    //在这里创建block时需要注意要用点语法
    //block本身的作于域是属于创建时候的作用域，一旦在创建时候的作用域外面调用block将导致程序崩溃。
    _testBlock = ^() {
        testNumber += 1;
//        testNumberTwo += 1;
        NSLog(@"testBllock %d", testNumber);
        NSLog(@"####%d", testNumberTwo);
        NSLog(@"%p", &testNumberTwo);
    };
    NSLog(@"testBlock %d", testNumber);
    
    //Block中使用__block修饰的变量时，将取变量此刻运行时的值，而不是定义时的快照。这个例子中，执行sum(1,2)时，base将取base++之后的值，也就是201，再执行Blockbase+=10; base+a+b，运行结果是214。执行完Block时，base已经变成211了。
    
    __block int base = 100;
    base += 100;
    BlkSum sum = ^ long (int a, int b) {
        base += 10;
        return base + a + b;
    };
    base++;
    NSLog(@"%ld",sum(1,2));
    NSLog(@"%d",base);
    //使用copy也可以解决点击button崩溃
//    _testBlock = [_testBlock copy];
    _testBlock = Block_copy(_testBlock);
    [self creatButtons];
}

- (void)testBlockMemory:(UIButton *)button
{
    //block自身内存管理
    //在这里点击button程序会崩溃原因在于在block创建的时候是在内存的栈上在这里调用超出作用域
    self.testBlock();
}

- (void)pushNextVC:(UIButton *)button
{
    QYTestViewController *VC = [[QYTestViewController alloc] init];
    [self presentViewController:VC animated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)creatButtons
{
    //    self.testBlock();
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 120, 80)];
    [button setTitle:@"testBtn" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(testBlockMemory:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release],button = nil;
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 120, 80)];
    [button2 setTitle:@"change" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(pushNextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 release], button2 = nil;
}

- (void)dealloc
{
    Block_release(_testBlock);
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
