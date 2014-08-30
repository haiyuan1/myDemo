//
//  CircleLayout.h
//  CircleCollectionView
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;

@end
