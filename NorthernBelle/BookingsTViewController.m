//
//  BookingsTViewController.m
//  NorthernBelle
//
//  Created by tyms on 26/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "Model.h"
#import "BookingsTViewController.h"
#import "SingleBookingController.h"

@interface BookingsTViewController ()

@end


@implementation BookingsTViewController
@synthesize requestResult;
@synthesize bookingsSize;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bookingsSize = 0;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    Model *conn = [[Model alloc] init];
    return [[conn getAllBookings] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in a section.
    //return *[self bookingsSize];
    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    Model *conn = [[Model alloc] init];
    NSArray *list = [conn getAllBookings];
    cell.textLabel.text = [list objectAtIndex:indexPath.section];
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
        if ([[segue identifier] isEqualToString:@"singleBookingSegue"]) {
            //SingleBookingController *sbvc = (SingleBookingController*)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *cell = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
            SingleBookingController *sbvc = (SingleBookingController*)segue.destinationViewController;
            [sbvc setDetailItem:cell ];
            //[[[newview singleBookingDetailTextLabel] textlabel ]text] ;
        }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
