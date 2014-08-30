//
//  CircleLayout.m
//  CircleCollectionView
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout ()

@property (nonatomic, retain) NSMutableArray *deleteIndexPaths;
@property (nonatomic, retain) NSMutableArray *insertIndexPaths;

@end

@implementation CircleLayout

- (void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    self.center = CGPointMake(size.width / 2.0, size.height / 2.0);
    self.radius = MIN(size.width, size.height) / 2.5;
}

- (CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(30, 30);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2 * indexPath.item * M_PI / _cellCount));
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (int i = 0; i < self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
    
    self.deleteIndexPaths = [NSMutableArray array];
    self.insertIndexPaths = [NSMutableArray array];
    
    for (UICollectionViewUpdateItem *update in updateItems) {
        if (update.updateAction == UICollectionUpdateActionDelete) {
            
            [self.deleteIndexPaths addObject:update.indexPathBeforeUpdate];
            
        } else if (update.updateAction == UICollectionUpdateActionInsert) {
            
            [self.insertIndexPaths addObject:update.indexPathAfterUpdate];
            
        }
    }
}

- (void)finalizeCollectionViewUpdates
{
    [super finalizeCollectionViewUpdates];
    self.deleteIndexPaths = nil;
    self.insertIndexPaths = nil;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    if ([self.insertIndexPaths containsObject:itemIndexPath]) {
        if (!attributes)
            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
            attributes.alpha = 0.0;
            attributes.center = CGPointMake(_center.x, _center.y);
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    if ([self.deleteIndexPaths containsObject:itemIndexPath]) {
        if (!attributes)
            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
            attributes.alpha = 0.0f;
            attributes.center = CGPointMake(_center.x, _center.y);
            attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    }
    return attributes;
}

@end
