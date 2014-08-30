//
//  QYMKAnnotationView.h
//  MapViewDemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "QYonButton.h"


@interface QYMKAnnotationView : MKAnnotationView

@property (weak, nonatomic) id <QYonButton>delegate;

@end
