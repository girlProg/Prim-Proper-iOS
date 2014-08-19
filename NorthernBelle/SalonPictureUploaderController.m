//
//  SalonPictureUploaderController.m
//  Prim&Proper
//
//  Created by tyms on 14/12/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "SalonPictureUploaderController.h"
#import "Model.h"

@implementation SalonPictureUploaderController

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (IBAction)uploadPhoto:(UIButton *)sender
{
    Model *m = [[Model alloc]init];
    UIAlertView *dialog;
    NSString* serverResponse = [m uploadImage:self.imageView.image];
    
    if ( [ serverResponse isEqual:@"Photo Uploaded!"] ){
        dialog = [[UIAlertView alloc]initWithTitle:@"Prim&Proper" message:serverResponse delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [dialog show];
    }
    else{
        dialog = [[UIAlertView alloc]initWithTitle:@"Prim&Proper" message:@"Error with Upload" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [dialog show];
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
