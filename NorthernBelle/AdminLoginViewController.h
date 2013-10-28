//
//  AdminLoginViewController.h
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminLoginViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)loginToPrim:(id)sender;

@end
