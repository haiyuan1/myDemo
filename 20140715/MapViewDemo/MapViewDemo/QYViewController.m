//
//  QYViewController.m
//  MapViewDemo
//
//  Created by qingyun on 14-7-16.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <MapKit/MapKit.h>
#import "QYMKAnnotationView.h"
#import "QYonButton.h"

@interface QYViewController () <MKMapViewDelegate, CLLocationManagerDelegate, QYonButton>

@property (nonatomic, retain) CLLocationManager *locationManager;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.tag = 1000;
    //设置经纬度的跨度值越小显示的地图内容越详细，值越大显示的地图区域越大
    MKCoordinateSpan span = {1,1};
    //设置经纬度坐标值
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    mapView.region = region;
    mapView.showsUserLocation = YES;
    
    mapView.mapType = MKMapTypeStandard;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
    //定位
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.title = @"河南省";
    pointAnnotation.subtitle = @"郑州市";
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    
    [mapView addAnnotation:pointAnnotation];
    mapView.userLocation.title = @"绿地原盛国际";
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = locations[0];
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = {newLocation.coordinate, span};
    MKMapView *mapView = (MKMapView *)[self.view viewWithTag:1000];
    [mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", NSStringFromSelector(@selector(locationManager:didFailWithError:)));
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString *customViewIndentifier = @"CustomViewIndentifier";
    QYMKAnnotationView *customAnnotationView = (QYMKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:customViewIndentifier];
    if ( nil == customAnnotationView) {
        customAnnotationView = [[QYMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customViewIndentifier];
        customAnnotationView.delegate = self;
    }
    return customAnnotationView;
}
#if 1
- (void)onButton
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Test" message:@"customAnnotation" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [alertView show];
}
#endif

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
