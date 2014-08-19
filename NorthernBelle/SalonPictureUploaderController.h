//
//  SalonPictureUploaderController.h
//  Prim&Proper
//
//  Created by tyms on 14/12/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SalonPictureUploaderController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)uploadPhoto:(UIButton *)sender;

@end
