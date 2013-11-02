//
//  NBTViewController.m
//  NorthernBelle
//
//  Created by tyms on 25/09/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "NBTViewController.h"
#import "Model.h"

@interface NBTViewController ()

@end

@implementation NBTViewController

@synthesize customerNameTextfield;
@synthesize serviceBar;
@synthesize bookingTime;
@synthesize contactNumberTextfield;
@synthesize headerText;
@synthesize hairService;

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
    //self.navigationItem.title = self.headerText;
    self.serviceBar.title = self.headerText;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitBooking:(id)sender {
    
    NSString *cn = self.customerNameTextfield.text;
    NSString *serv = self.serviceBar.title;
    NSDate *bt = self.bookingTime.date;
    NSString *num = self.contactNumberTextfield.text;
    UIAlertView* dialog;
    
    if ( [cn isEqual:@""] | [num isEqualToString:@""]){
        dialog = [[UIAlertView alloc]initWithTitle:@"Prim&Proper" message:@"Please provide both Name and Phone Number. Thank you :)" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [dialog show];
    }
    else{
    
    Model *m = [[Model alloc]init];
    NSString *serverResponse = [m makeBooking:cn service:serv dateAndTime:bt contactNumber:num];
    dialog = [[UIAlertView alloc] initWithTitle:@"Prim&Proper \n"
                                                     message:[serverResponse stringByReplacingOccurrencesOfString:@"\""withString:@""]                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"OK", nil];
    [dialog show];
    }

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    if (theTextField == self.contactNumberTextfield) {
        
        [theTextField resignFirstResponder];
        
    }
    
    if (theTextField == self.customerNameTextfield ) {
        
        [theTextField resignFirstResponder];
        
    }
    
    return YES;
    
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
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
*/

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
