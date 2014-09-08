//
//  ViewController.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/4/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Directory.h"
#import "Tree.h"
#import "employeeDirectory.h"

@interface ViewController ()
@property (strong,nonatomic) NSArray *sections;
@property (strong,nonatomic) NSDictionary *contacts;
@property (strong,nonatomic) NSMutableArray *people;
@end

@implementation ViewController
//Name



@synthesize sections;
@synthesize people;
@synthesize contacts;


NSUserDefaults *prefs;
Person *person;


- (void)viewDidLoad
{
    
    prefs = [NSUserDefaults standardUserDefaults];
    people = [[NSMutableArray alloc] init];
    sections = @[@"No Data...",@"No Data...",@"No Data...",@"Settings/Sync"];
    contacts = [prefs objectForKey:@"contacts"];
    
    if (contacts == nil) {
        
    }
    else{
        for (id items in contacts) {
            NSDictionary *item = [contacts valueForKey:items];
            person = [[Person alloc] init];
            person.firstName = [item valueForKey:@"First_Name"];
            person.number = [item valueForKey:@"Phone_Number"];
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
        sections = @[@"Health Center Directory",@"Health Center Employee Directory",@"Emergancy Calling Tree",@"Settings/Sync"];
    }
    
    

    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sections count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"healthCenterMain";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.textLabel.text = [sections objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0 && [people count] != 0){
        [self performSegueWithIdentifier:@"goToDirectory" sender:self];
    }
    else if(indexPath.row == 1 && [people count] != 0){
        [self performSegueWithIdentifier:@"goToEmployeeDirectory" sender:self];
    }
    else if (indexPath.row == 2 && [people count] != 0){
        [self performSegueWithIdentifier:@"goToTree" sender:self];
    }
    else if (indexPath.row == 3){
        [self performSegueWithIdentifier:@"goToSettings" sender:self];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToDirectory"]){
        Directory *controller = [segue destinationViewController];
        controller.people = people;
    }
    else if([segue.identifier isEqualToString:@"goToEmployeeDirectory"]){
        employeeDirectory *controller = [segue destinationViewController];
        controller.people = people;
    }
    else if([segue.identifier isEqualToString:@"goToTree"]){
        Tree *controller = [segue destinationViewController];
        controller.people = people;
    }
}

@end
