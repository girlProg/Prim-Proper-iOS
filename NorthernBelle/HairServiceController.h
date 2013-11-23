//
//  HairServiceController.h
//  NorthernBelle
//
//  Created by tyms on 24/10/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HairServiceController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *hairServicePicker;
@property (strong, nonatomic) NSArray *hairServicesArray;
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (nonatomic) NSString* headerText;
@property (nonatomic) NSString* hairService;



@end
