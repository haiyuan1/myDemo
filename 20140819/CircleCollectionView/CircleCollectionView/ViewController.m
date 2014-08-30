//
//  ViewController.m
//  CircleCollectionView
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger cellCount;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cellCount = 0;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    [self.collectionView addGestureRecognizer:tapGesture];
    
    self.collectionView.backgroundColor = [UIColor orangeColor];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"cellID"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

#pragma mark - TapGuresture Handle Event
- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint currentPoint = [gesture locationInView:self.collectionView];
        NSIndexPath *tappedIndexPath = [self.collectionView indexPathForItemAtPoint:currentPoint];
        if (tappedIndexPath != nil) {
            self.cellCount -= 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:@[tappedIndexPath]];
            } completion:NULL];
        } else {
            self.cellCount += 1;
            [self.collectionView performBatchUpdates:^{
                NSIndexPath *insertIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                [self.collectionView insertItemsAtIndexPaths:@[insertIndexPath]];
            } completion:NULL];
        }
    }
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
