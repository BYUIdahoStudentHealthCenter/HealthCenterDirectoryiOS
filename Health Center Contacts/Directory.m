//
//  Directory.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/25/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "Directory.h"
#import "Information.h"
#import "Person.h"
@interface Directory ()
@property (strong,nonatomic) NSMutableArray* contacts;
@property (nonatomic) NSInteger index;
@property (strong,nonatomic) NSArray *healthCenterContactNames;
@property (strong,nonatomic) NSArray *healthCenterContactNumbers;
@property (strong,nonatomic) NSArray *healthCenterContactName;
@property (strong,nonatomic) NSArray *healthCenterContactNumber;
@property (strong,nonatomic) NSArray *fronDeskContactName;
@property (strong,nonatomic) NSArray *fronDeskContactNumber;
@property (strong,nonatomic) NSArray *studentManagementContactName;
@property (strong,nonatomic) NSArray *studentManagementContactNumber;
@property (strong,nonatomic) NSArray *otherStudentContactName;
@property (strong,nonatomic) NSArray *otherStudentContactNumber;
@property (strong,nonatomic) NSArray *providersContactName;
@property (strong,nonatomic) NSArray *providersContactNumber;
@property (strong,nonatomic) NSArray *professionalStaffContactName;
@property (strong,nonatomic) NSArray *professionalStaffContactNumber;
@property (strong,nonatomic) NSArray *faxContactName;
@property (strong,nonatomic) NSArray *faxContactNumber;
@property (strong,nonatomic) NSArray *campusContactName;
@property (strong,nonatomic) NSArray *campusContactNumber;
@property (strong,nonatomic) NSArray *otherContactName;
@property (strong,nonatomic) NSArray *otherContactNumber;

@end

@implementation Directory
@synthesize contacts;
@synthesize people;
@synthesize healthCenterContactNames;
@synthesize healthCenterContactNumbers;
@synthesize healthCenterContactName;
@synthesize healthCenterContactNumber;
@synthesize fronDeskContactName;
@synthesize fronDeskContactNumber;
@synthesize studentManagementContactName;
@synthesize studentManagementContactNumber;
@synthesize otherStudentContactName;
@synthesize otherStudentContactNumber;
@synthesize providersContactName;
@synthesize providersContactNumber;
@synthesize professionalStaffContactName;
@synthesize professionalStaffContactNumber;
@synthesize faxContactName;
@synthesize faxContactNumber;
@synthesize campusContactName;
@synthesize campusContactNumber;
@synthesize otherContactName;
@synthesize otherContactNumber;
@synthesize index;

- (void)viewDidLoad
{
    contacts = [[NSMutableArray alloc]init];
    healthCenterContactName =@[@"General",@"Health Desk",@"Fax",@"Conference Room"];
    
    healthCenterContactNumber = @[@"",@"208-496-9330",@"208-496-9333",@"9335"];
    
    
    
    
    
    fronDeskContactName = @[@"Front Desk Lines",@"Check Out",@"Check In",@"Insurance 1",@"Insurance 2",@"Office Assistants",@"Walk-In"];
    
    fronDeskContactNumber = @[@"",@"789331",@"789334",@"789332",@"789333",@"789336",@"789335"];
    
    
    
    studentManagementContactName = @[@"Student Management",@"Area Director",@"Clinical Care Manager",@"Operations Manager"];
    
    studentManagementContactNumber = @[@"",@"9334",@"9345",@"789356"];
    
    
    
    otherStudentContactName = @[@"Other Student Employees",@"IT",@"Communications",@"HR",@"Lab",@"Patient Flow",@"Pharmacy",@"Public Health",@"Wellness"];
    
    otherStudentContactNumber = @[@"",@"789345",@"9344",@"789356",@"789356",@"789356",@"9342",@"9353",@"9345"];
    
    
    
    providersContactName = @[@"Providers",@"Christy Goodman",@"Dr. Bradbury",@"Dr. Rammell",@"Lori Parker",@"Nichole Robson",@"Steve Lemons",@"Terry Anderson"];
    
    providersContactNumber = @[@"",@"789351",@"789352",@"789353",@"789347",@"9346",@"9354",@"789354"];
    
    
    
    
    
    professionalStaffContactName = @[@"Professional Staff",@"Stephanie Potter (Lab)",@"Marilyn Walker (Nurse)",@"Tiffany Paepke (Nurse)",@"Nurse's Station",@"Ruth Clark (Billing)",@"Shaun Orr (Director)",@"Shawn Andreason (Pharmacy)",@"Tammy Einerson (Operations)",@"Lisa Nelson (X-Ray)",@"Vickie Christensen (X-Ray) "];
    
    professionalStaffContactNumber = @[@"",@"9344",@"9348",@"9345",@"9331",@"9340",@"9341",@"9347",@"789350",@"9349",@"9349"];
    
    
    
    
    
    faxContactName = @[@"Fax Numbers",@"Lab",@"Pharmacy",@"Public Health",@"X-Ray"];
    
    faxContactNumber = @[@"",@"208-496-6911",@"208-496-9343",@"208-496-9343",@"208-496-5911"];
    
    
    
    
    
    campusContactName = @[@"Campus Contacts",@"Counseling Center",@"Accounting Office",@"Admissions",@"Ask BYU-I",@"Cashiers Office",@"Financial Aid Office",@"Human Resource",@"Help Desk",@"Mary Ivie (Phones)",@"Records and Registration",@"Security",@"Wellness Center"];
    
    campusContactNumber = @[@"",@"9370",@"1900",@"1300",@"1400",@"1931",@"1600",@"1700",@"9000",@"9001",@"1000",@"3000",@"7491"];
    
    
    
    otherContactName = @[@"Provo/Other Contacts",@"Matt Tilton",@"Wayne Buckwalter",@"Kerry Stanger",@"DMBA"];
    
    otherContactNumber = @[@"",@"801-422-5165",@"801-422-5167",@"801-422-6140",@"800-777-3622"];
    
    
    
    healthCenterContactNumbers = [healthCenterContactNumber arrayByAddingObjectsFromArray:fronDeskContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:studentManagementContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:otherStudentContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:providersContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:professionalStaffContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:faxContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:campusContactNumber];
    
    healthCenterContactNumbers = [healthCenterContactNumbers arrayByAddingObjectsFromArray:otherContactNumber];
    
    
    
    
    
    healthCenterContactNames = [healthCenterContactName arrayByAddingObjectsFromArray:fronDeskContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:studentManagementContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:otherStudentContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:providersContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:professionalStaffContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:faxContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:campusContactName];
    
    healthCenterContactNames = [healthCenterContactNames arrayByAddingObjectsFromArray:otherContactName];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    return [healthCenterContactNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"healthCenterDirectory";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.textLabel.text = [healthCenterContactNames objectAtIndex:indexPath.row];
    
    if(indexPath.row < 64)
    {
        switch (indexPath.row){
            case 0:
            case 4:
            case 11:
            case 15:
            case 24:
            case 32:
            case 43:
            case 48:
            case 61:
                cell.contentView.backgroundColor = [UIColor lightGrayColor];
                cell.textLabel.backgroundColor = [UIColor lightGrayColor];
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.userInteractionEnabled = NO;
                break;
                
            default:
                cell.contentView.backgroundColor = [UIColor whiteColor];
                cell.textLabel.backgroundColor = [UIColor whiteColor];
                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                cell.userInteractionEnabled = YES;
                break;
        }
        cell.textLabel.text = [healthCenterContactNames objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [healthCenterContactNumbers objectAtIndex:indexPath.row];
        cell.detailTextLabel.textColor = [UIColor redColor];
        
        
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row){
            
        case 0:
            
        case 4:
            
        case 11:
            
        case 15:
            
        case 24:
            
        case 32:
            
        case 43:
            
        case 48:
            
        case 61:
            
            return 20.;
            
            break;
            
        default:
            
            return 44.;
            
            break;
            
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

        index = indexPath.row;
    
    [self performSegueWithIdentifier:@"goToInfo" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString: @"goToInfo"]){
        
        NSData *data;
        
        Information *controller = (Information *)segue.destinationViewController;
        for (Person *person in people) {
            if([person.dptNumber isEqualToString:[healthCenterContactNumbers objectAtIndex:index]]){
                NSString *string =[NSString stringWithFormat:@"http://www.byui.edu/Images/health-center/Students/%@.png",person.imageName];
                NSURL *url = [NSURL URLWithString:string];
                
                data = [NSData dataWithContentsOfURL:url];
                if(data == nil){
                    NSLog(@"%@",@"filled");
                }
                
                [contacts addObject:person];
            }                                                                                                                                                                                                         
        }
        
        controller.name = [healthCenterContactNames objectAtIndex:index];
        controller.number = [healthCenterContactNumbers objectAtIndex:index];
        NSLog(@"%lu",(unsigned long)[contacts count]);
        controller.people = contacts;
        controller.data = data;
        controller.collection = people;
    }
}



@end
