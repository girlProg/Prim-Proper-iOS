//
//  SingleBookingController.m
//  NorthernBelle
//
//  Created by tyms on 23/10/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "SingleBookingController.h"
//#import "BookingsTViewController.h"

@interface SingleBookingController ()

@end

@implementation SingleBookingController

@synthesize singleBookingDetailTextLabel;

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
    self.singleBookingDetailTextLabel.text = self.detailItem;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
