//
//  ViewController.h
//  MapKitDemo
//
//  Created by Hardik Trivedi on 13/10/2015.
//  Copyright (c) 2015 iHartDevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *objLocationManager;
    double latitude_UserLocation, longitude_UserLocation;
}

@property (weak, nonatomic) IBOutlet MKMapView *objMapView;
@property (weak, nonatomic) IBOutlet UIButton *btnStandard;
@property (weak, nonatomic) IBOutlet UIButton *btnSatellite;
@property (weak, nonatomic) IBOutlet UIButton *btnHybrid;

@end

