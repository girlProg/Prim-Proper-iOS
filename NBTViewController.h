//
//  NBTViewController.h
//  NorthernBelle
//
//  Created by tyms on 25/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBTViewController : UITableViewController <UITextFieldDelegate>

- (IBAction)submitBooking:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *customerNameTextfield;
@property (weak, nonatomic) IBOutlet UIDatePicker *bookingTime;
@property (weak, nonatomic) IBOutlet UINavigationItem *serviceBar;
@property (weak, nonatomic) IBOutlet UITextField *contactNumberTextfield;
@property (nonatomic) NSString* headerText;
@property (nonatomic) NSString* hairService;

@end
