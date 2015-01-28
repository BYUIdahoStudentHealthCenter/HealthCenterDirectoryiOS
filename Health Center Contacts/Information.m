//
//  Information.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/25/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "Information.h"
#import "Person.h"
#import "tableCells.h"
#import "Directory.h"

@interface Information ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *view;



@end

@implementation Information
@synthesize titleLabel;
@synthesize numberLabel;
@synthesize name;
@synthesize number;
@synthesize people;
@synthesize data;
@synthesize collection;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%lu",(unsigned long)[people count]);
    titleLabel.title = name;
    numberLabel.text = number;
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [people count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"infoCells";
    
    Person *person = [people objectAtIndex:indexPath.row];
    
    
    

    NSString *contactName = [NSString stringWithFormat:@"%@ %@",person.firstName,person.lastName];
    
    tableCells *cell = (tableCells *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    UIImage* myImage = [UIImage imageWithData: data];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Empty" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
     cell.customLabel.text = contactName;
    [cell.customImage setImage:myImage];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Directory *controller = (Directory *)segue.destinationViewController;
    controller.people = collection;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 126;
}

@end
