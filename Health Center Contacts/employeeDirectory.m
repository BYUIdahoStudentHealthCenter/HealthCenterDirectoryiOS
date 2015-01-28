//
//  employeeDirectory.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/27/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "employeeDirectory.h"
#import "Person.h"
#import "EmployeeDetailsTableVC.h"

@interface employeeDirectory ()
@property NSArray *employeeNames;
@property NSArray *employeeNumbers;
@property NSMutableArray *searchResults;
@property (strong,nonatomic) NSDictionary *contacts;
@property Person *person;
@property Person *personPass;
@end

@implementation employeeDirectory
@synthesize employeeNames;
@synthesize employeeNumbers;
@synthesize searchResults;
@synthesize contacts;

Person *person;
Person *personPass;
NSUserDefaults *prefs;

@synthesize people;

-(void) filterContentForSearchText:(NSString*)searchText{
    //[searchResults removeAllObjects];
    NSPredicate * resultPredicate = [NSPredicate predicateWithFormat:@"firstName beginswith[c] %@", searchText];
    searchResults = [NSMutableArray arrayWithArray:[people filteredArrayUsingPredicate:resultPredicate]];
}

-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    [self filterContentForSearchText:searchString];
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    people = [[NSMutableArray alloc] init];
    
    NSLog(@"Before reading prefs %ld", [people count]);
    prefs = [NSUserDefaults standardUserDefaults];
    self.title = @"Employee Directory";
    
    contacts = [prefs objectForKey:@"contacts"];
    NSLog(@"Number of items in contacts %ld", [contacts count]);
    
    for (id items in contacts) {
        NSDictionary *item = [contacts valueForKey:items];
        person = [[Person alloc] init];
        person.firstName = [item valueForKey:@"First_Name"];
        person.number = [item valueForKey:@"Personal_Number"];
        person.lastName = [item valueForKey:@"Last_Name"];
        person.dptEmail = [item valueForKey:@"Department_Email"];
        person.dptNumber = [item valueForKey:@"Department_Number"];
        person.imageName = [item valueForKey:@"Image_Name"];
        person.schEmail = [item valueForKey:@"Personal_Email"];
        person.position = [item valueForKey:@"Position"];
        person.status = [item valueForKey:@"Status"];
        person.tier = [item valueForKey:@"Tier"];
        [people addObject:person];
    }
    
    NSLog(@"Number of items in people %ld", [people count]);

    
/* Sorts by last name */
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [people sortedArrayUsingDescriptors:sortDescriptors];
    
    people = [NSMutableArray arrayWithArray:sortedArray];
    
    
 


}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        NSInteger number = [searchResults count];
        return [searchResults count];
        NSLog(@"if %ld", (long)number);

        
    }
    else{
        NSInteger number = [people count];
        NSLog(@"else %ld", (long)number);
        return number;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"employeeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
    }
    
   if(tableView == self.searchDisplayController.searchResultsTableView){
       person = [searchResults objectAtIndex:indexPath.row];

       NSString *f3 = [person.number substringToIndex:3];
       NSString *m3 = [person.number substringWithRange:NSMakeRange(3,3)];
       NSString *l4 = [person.number substringWithRange:NSMakeRange(6,4)];
       
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",person.lastName,person.firstName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-%@-%@",f3,m3,l4];
    }
    else{
        person = [people objectAtIndex:indexPath.row];
        //NSLog(@"%@",person.number);
        NSString *f3 = [person.number substringToIndex:3];
        NSString *m3 = [person.number substringWithRange:NSMakeRange(3, 3)];
        NSString *l4 = [person.number substringWithRange:NSMakeRange(6, 4)];
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",person.lastName,person.firstName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-%@-%@",f3,m3,l4];

    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSString *phoneNumber = [@"telprompt://" stringByAppendingString:cell.detailTextLabel.text];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
    // selects person from people array at the index
    personPass = [people objectAtIndex:indexPath.row];
    NSLog(@"%@%@", @"Person =", [[people objectAtIndex:indexPath.row] firstName]);

    [self performSegueWithIdentifier:@"goToEmployeeDetails" sender:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"goToEmployeeDetails"]){
        // Sets controller Object to be the goToEmployeeDetails object
        
        EmployeeDetailsTableVC *nextViewController = [segue destinationViewController];
        nextViewController.contact = personPass;
        NSLog(@"%@%@", @"Controller =", personPass.firstName);

    }

}




@end
