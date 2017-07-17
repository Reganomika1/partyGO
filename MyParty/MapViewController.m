//
//  MapViewController.m
//  MyParty
//
//  Created by Zakhar on 7/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Карта";

    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController )
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_menu"]
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self.revealViewController
                                                                                action:@selector( revealToggle: )];
        
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.mapView.myLocationEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
