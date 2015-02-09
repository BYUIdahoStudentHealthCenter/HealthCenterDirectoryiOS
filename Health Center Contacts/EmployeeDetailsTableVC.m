//
//  EmployeeDetailsTableVC.m
//  Health Center Contacts
//
//  Created by chad eddington on 1/15/15.
//  Copyright (c) 2015 BYU-Idaho. All rights reserved.
//

#import "EmployeeDetailsTableVC.h"


// Private variables and methods
@interface EmployeeDetailsTableVC ()
@property (weak, nonatomic) IBOutlet UINavigationItem *navBarTitle;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;

@end

@implementation EmployeeDetailsTableVC

NSMutableArray *contactDetails;
NSArray *detailsLabel;
@synthesize contact;
@synthesize navBarTitle;
@synthesize profilePicture;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fullName = [NSString stringWithFormat:@"%@ %@",contact.firstName,contact.lastName];
    contactDetails = [[NSMutableArray alloc] initWithObjects:contact.dptEmail, contact.dptNumber, contact.schEmail, contact.number, contact.position, contact.status, contact.tier, nil];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary *pictures = [prefs objectForKey:@"pictures"];
    
    

    
    detailsLabel = [NSArray arrayWithObjects:@"Dept Email", @"Dept Number", @"School Email", @"Phone Number", @"Position", @"Status", @"Tier", nil];
    
    //self.nameLabel.numberOfLines = 1;
   // self.nameLabel.adjustsFontSizeToFitWidth = YES;
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
    self.nameLabel.text = fullName;
    
    // Replace the actual number with a formated string
    //
    NSString *f3 = [[contactDetails objectAtIndex:3] substringToIndex:3];
    NSString *m3 = [[contactDetails objectAtIndex:3] substringWithRange:NSMakeRange(3, 3)];
    NSString *l4 = [[contactDetails objectAtIndex:3] substringWithRange:NSMakeRange(6, 4)];
    [contactDetails replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"%@-%@-%@",f3,m3,l4]];

    
    

    
    @try {
        NSString* imgString = [[pictures objectForKey:fullName] objectForKey:@"imageData"];
        NSData* imgData = [[NSData alloc] initWithBase64EncodedString:imgString options:0];
        UIImage *image = [UIImage imageWithData:imgData];
        [[self view] addSubview:[profilePicture initWithImage:image]];
    } @catch (NSException* e) {
        NSLog(@"Exception: %@", e);
    }
    

    
    
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

//Number of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [contactDetails count];
}


// Each Cell

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"employeeDetail";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    
    // sets the cell style
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    
    
    // Configure the cell...
    NSString *details = [contactDetails objectAtIndex:indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = [detailsLabel objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = details;

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)back:(id)sender {
    [self.delegate employeeDetailsGoBack:self];
}


@end
