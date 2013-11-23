//
//  SelectServiceViewController.m
//  NorthernBelle
//
//  Created by tyms on 21/10/2013.
//  Copyright (c) 2013 tyms. All rights reserved.
//

#import "SelectServiceViewController.h"
#import "NBTViewController.h"
#import "HairServiceController.h"

@interface SelectServiceViewController ()

@end

@implementation SelectServiceViewController

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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"makeBookingSegue"]){
        
        //UINavigationController *uinav = (UINavigationController*)segue.destinationViewController;
        
        NBTViewController *nbvc = (NBTViewController*)segue.destinationViewController;
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        nbvc.headerText = [[[self.tableView  cellForRowAtIndexPath:path] textLabel] text];
        

    }
    
    if ([segue.identifier isEqualToString:@"hairServiceSegue"]){
        
        HairServiceController *hsvc = (HairServiceController*)segue.destinationViewController;
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        hsvc.headerText = [[[self.tableView  cellForRowAtIndexPath:path] textLabel] text];
    }

}


- (void)onButtonTapped:(UITableViewCell *)cellie {
    
    UITableViewCell *cell = (UITableViewCell *)cellie.superview.superview;
    NSIndexPath *indexPath =  [self.tableView indexPathForCell:cell];
    NSLog(@"%@", indexPath);
    //use indexPath here...
}

/*

#pragma mark - Table view data source

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
}*/

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




@end
