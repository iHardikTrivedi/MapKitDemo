//
//  ViewController.m
//  MapKitDemo
//
//  Created by Hardik Trivedi on 13/10/2015.
//  Copyright (c) 2015 iHartDevelopers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View Life Cycle Method

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadUserLocation];
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0)
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [objLocationManager stopUpdatingLocation];
    
    [self loadMapView];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [objLocationManager stopUpdatingLocation];
}

#pragma mark - IBAction Methods

- (IBAction)btnStandardTapped:(id)sender
{
    [self.btnStandard setBackgroundColor:[UIColor greenColor]];
    [self.btnSatellite setBackgroundColor:[UIColor clearColor]];
    [self.btnHybrid setBackgroundColor:[UIColor clearColor]];
    [self.objMapView setMapType:MKMapTypeStandard];
    
    [self loadUserLocation];
}

- (IBAction)btnSatelliteTapped:(id)sender
{
    [self.btnStandard setBackgroundColor:[UIColor clearColor]];
    [self.btnSatellite setBackgroundColor:[UIColor greenColor]];
    [self.btnHybrid setBackgroundColor:[UIColor clearColor]];
    [self.objMapView setMapType:MKMapTypeSatellite];
    
    [self loadUserLocation];
}

- (IBAction)btnHybridTapped:(id)sender
{
    [self.btnStandard setBackgroundColor:[UIColor clearColor]];
    [self.btnSatellite setBackgroundColor:[UIColor clearColor]];
    [self.btnHybrid setBackgroundColor:[UIColor greenColor]];
    [self.objMapView setMapType:MKMapTypeHybrid];
    
    [self loadUserLocation];
}

#pragma mark - Other Methods

- (void) loadUserLocation
{
    objLocationManager = [[CLLocationManager alloc] init];
    objLocationManager.delegate = self;
    objLocationManager.distanceFilter = kCLDistanceFilterNone;
    objLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    if ([objLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [objLocationManager requestWhenInUseAuthorization];
    }
    
    [objLocationManager startUpdatingLocation];
}

- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude =  latitude_UserLocation, .longitude =  longitude_UserLocation};
    MKCoordinateSpan objCoorSpan = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [self.objMapView setRegion:objMapRegion];
}

@end
