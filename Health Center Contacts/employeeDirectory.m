//
//  employeeDirectory.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/27/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "employeeDirectory.h"
#import "Person.h"

@interface employeeDirectory ()
@property NSArray *employeeNames;
@property NSArray *employeeNumbers;
@property NSMutableArray *searchResults;
@property Person *person;
@end

@implementation employeeDirectory
@synthesize employeeNames;
@synthesize employeeNumbers;
@synthesize searchResults;

Person *person;
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
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [people sortedArrayUsingDescriptors:sortDescriptors];
    
    people = [NSMutableArray arrayWithArray:sortedArray];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(tableView == self.searchDisplayController.searchResultsTableView){
        NSInteger number = [searchResults count];
        NSLog(@"%ld",(long)number);
        return [searchResults count];
        
    }
    else{
        NSInteger number = [people count];
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
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:cell.detailTextLabel.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
