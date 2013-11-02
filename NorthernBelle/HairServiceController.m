//
//  HairServiceController.m
//  NorthernBelle
//
//  Created by tyms on 24/10/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "HairServiceController.h"
#import "NBTViewController.h"

@interface HairServiceController ()

@end

@implementation HairServiceController
@synthesize hairServicePicker;
@synthesize hairServicesArray;
@synthesize noticeLabel;
@synthesize headerText, hairService;

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
    self.hairServicesArray = [[NSArray alloc] initWithObjects:@"Steaming", @"Wash & Blowdry", @"Yoghurt Protien Treatment", @"Relaxing", @"Dying", @"Braids", nil ];
    [self.hairServicePicker setDataSource:self];
    self.noticeLabel.text = @"Please note all our Hair services are without the use of extensions and attachments :)";
    
    self.navigationItem.title = self.headerText;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView :(UIPickerView*)pickerView
{
    return 1;
}

-(NSInteger)pickerView :(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.hairServicesArray count];
}


-(NSString*)pickerView :(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.hairServicesArray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString* selected;
    
    row = [pickerView selectedRowInComponent:component];
    self.hairService = [hairServicesArray objectAtIndex:row];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"makeBookingSegue"]){
    
        NBTViewController *nbvc = (NBTViewController*)segue.destinationViewController;
        
        nbvc.headerText = self.navigationItem.title;
        nbvc.hairService = self.hairService;
    }
}

@end
