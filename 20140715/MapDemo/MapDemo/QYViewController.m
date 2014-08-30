//
//  QYViewController.m
//  MapDemo
//
//  Created by qingyun on 14-7-15.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <MapKit/MapKit.h>
#import "QYCustomMKAnnotationView.h"

@interface QYViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (retain, nonatomic) CLLocationManager *locationMgr;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    map.tag = 1000;
    
    MKCoordinateSpan span = {1,1};
//    CLLocationCoordinate2D coordinate = {34,113};
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    
    //地理位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error != nil) {
            NSLog(@"Error:%@", error);
            return ;
        }
        
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"========%@, %@, %@, %@, %@", placemark.country, placemark.administrativeArea, placemark.locality, placemark.thoroughfare, placemark.subAdministrativeArea);
        }
    }];
    MKCoordinateRegion region = {coordinate, span};
    map.region = region;
    
//    map.zoomEnabled = NO;
//    map.scrollEnabled = NO;
    
    map.showsUserLocation = YES;
//    map.mapType = MKMapTypeSatellite;
    map.mapType = MKMapTypeStandard;
    map.delegate = self;
    [self.view addSubview:map];
    
    self.locationMgr = [[CLLocationManager alloc] init];
    self.locationMgr.distanceFilter = 1;
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationMgr.delegate = self;
    
    [self.locationMgr startUpdatingLocation];
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.title = @"河南省";
    pointAnnotation.subtitle = @"郑州市";
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    [map addAnnotation:pointAnnotation];
}

#pragma mark - LocationManager delegate

//与下面的方法功能相同在6.0以后不推荐使用
#if 0
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"new Location's lat:%f,long:%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    NSLog(@"old Location's lat:%f,long:%f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(newLocation.coordinate, span);
    MKMapView *mapView = (MKMapView *)[self.view viewWithTag:1000];
    [mapView setRegion:region animated:YES];
    
    CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
    NSLog(@"郑州距离苹果总部的距离为:%f", distance/1000);
    [self.locationMgr stopUpdatingLocation];
}
#endif
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", NSStringFromSelector(@selector(locationManager:didUpdateLocations:)));
    CLLocation *newLocation = locations[0];
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(newLocation.coordinate, span);
    MKMapView *newMap = (MKMapView *)[self.view viewWithTag:1000];
    [newMap setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(@selector(locationManager:didFailWithError:)));
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%s", __func__);
    NSLog(@"%@", error);
}

#pragma mark - mkMapView delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
#if 0
    static NSString *pinViewIdentifier = @"pingView";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinViewIdentifier];
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinViewIdentifier];
    }
    pinView.pinColor = MKPinAnnotationColorPurple;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
#endif
    static NSString *customViewIdentifier = @"customMKAnnotationView";
    QYCustomMKAnnotationView *customMKAnnotationView = (QYCustomMKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:customViewIdentifier];
    if (nil == customMKAnnotationView) {
        customMKAnnotationView = [[QYCustomMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customViewIdentifier];
    }
    return customMKAnnotationView;
}
- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
