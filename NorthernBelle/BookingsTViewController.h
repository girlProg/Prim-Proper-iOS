//
//  BookingsTViewController.h
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingsTViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *requestResult;
@property int bookingsSize;

@end
