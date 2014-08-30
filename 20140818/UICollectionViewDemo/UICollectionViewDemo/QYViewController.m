//
//  QYViewController.m
//  UICollectionViewDemo
//
//  Created by qingyun on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import "QYCell.h"
#import "QYDetailViewController.h"

//NSString *kDetailedViewControllerID = @"DetailView";
NSString *kCellID = @"cellID";

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionHeader"];
	
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 32;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QYCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"{%d,%d}", (int)indexPath.row, (int)indexPath.section];
    NSString *imageLoad = [NSString stringWithFormat:@"%d.JPG", (int)indexPath.row];
    cell.image.image = [UIImage imageNamed:imageLoad];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        NSString *imageNameToLoad = [NSString stringWithFormat:@"%d_full", (int)selectedIndexPath.row];
        NSString *pathToImage = [[NSBundle mainBundle] pathForResource:imageNameToLoad ofType:@"JPG"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathToImage];
        QYDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.image = image;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
