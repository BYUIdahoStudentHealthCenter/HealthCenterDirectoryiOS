//
//  Tree.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/25/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "Tree.h"
#import "Person.h"

@interface Tree ()

@property (nonatomic) NSInteger index;
@property (strong,nonatomic)Person *person;

@property (strong,nonatomic) NSMutableArray *tier1;

@property (strong,nonatomic) NSMutableArray *tier2A;
@property (strong,nonatomic) NSMutableArray *tier2B;
@property (strong,nonatomic) NSMutableArray *tier2C;
@property (strong,nonatomic) NSMutableArray *tier2D;
@property (strong,nonatomic) NSMutableArray *tier3A;
@property (strong,nonatomic) NSMutableArray *tier3B;
@property (strong,nonatomic) NSMutableArray *tier3C;
@property (strong,nonatomic) NSMutableArray *tier3D;
@property (strong,nonatomic) NSMutableArray *tier3E;
@property (strong,nonatomic) NSMutableArray *tier3F;
@property (strong,nonatomic) NSMutableArray *tier3G;
@property (strong,nonatomic) NSMutableArray *tier3H;
@property (strong,nonatomic) NSMutableArray *tier3I;
@property (strong,nonatomic) NSMutableArray *tier3J;

@property (strong,nonatomic) NSMutableArray *tier4A;
@property (strong,nonatomic) NSMutableArray *tier4B;
@property (strong,nonatomic) NSMutableArray *tier4C;
@property (strong,nonatomic) NSMutableArray *tier4D;
@property (strong,nonatomic) NSMutableArray *tier4E;
@property (strong,nonatomic) NSMutableArray *tier4F;
@property (strong,nonatomic) NSMutableArray *tier4G;
@property (strong,nonatomic) NSMutableArray *tier4H;
@property (strong,nonatomic) NSMutableArray *tier4I;
@property (strong,nonatomic) NSMutableArray *tier4J;

@property (strong,nonatomic) NSMutableArray *tier5A;
@property (strong,nonatomic) NSMutableArray *tier5B;
@property (strong,nonatomic) NSMutableArray *tier5C;
@property (strong,nonatomic) NSMutableArray *tier5D;
@property (strong,nonatomic) NSMutableArray *tier5E;
@property (strong,nonatomic) NSMutableArray *tier5F;
@property (strong,nonatomic) NSMutableArray *tier5G;

@property (strong,nonatomic) NSMutableArray *tier6;


@property (strong,nonatomic) NSMutableArray *currentTier;

@property NSMutableArray *config;


@end

@implementation Tree
@synthesize people;
@synthesize index;
@synthesize currentTier;
@synthesize config;
@synthesize person;

@synthesize tier1;

@synthesize tier2A;
@synthesize tier2B;
@synthesize tier2C;
@synthesize tier2D;
@synthesize tier3A;
@synthesize tier3B;
@synthesize tier3C;
@synthesize tier3D;
@synthesize tier3E;
@synthesize tier3F;
@synthesize tier3G;
@synthesize tier3H;
@synthesize tier3I;
@synthesize tier3J;

@synthesize tier4A;
@synthesize tier4B;
@synthesize tier4C;
@synthesize tier4D;
@synthesize tier4E;
@synthesize tier4F;
@synthesize tier4G;
@synthesize tier4H;
@synthesize tier4I;
@synthesize tier4J;

@synthesize tier5A;
@synthesize tier5B;
@synthesize tier5C;
@synthesize tier5D;
@synthesize tier5E;
@synthesize tier5F;
@synthesize tier5G;

@synthesize tier6;


NSMutableArray *integers;


- (void)viewDidLoad
{
    config = [[NSMutableArray alloc] init];
    tier1 = [[NSMutableArray alloc] init];
    tier2A = [[NSMutableArray alloc] init];
    tier2B = [[NSMutableArray alloc] init];
    tier2C = [[NSMutableArray alloc] init];
    tier2D = [[NSMutableArray alloc] init];
    tier3A = [[NSMutableArray alloc] init];
    tier3B = [[NSMutableArray alloc] init];
    tier3C = [[NSMutableArray alloc] init];
    tier3D = [[NSMutableArray alloc] init];
    tier3E = [[NSMutableArray alloc] init];
    tier3F = [[NSMutableArray alloc] init];
    tier3G = [[NSMutableArray alloc] init];
    tier3H = [[NSMutableArray alloc] init];
    tier3I = [[NSMutableArray alloc] init];
    tier3J = [[NSMutableArray alloc] init];
    tier4A = [[NSMutableArray alloc] init];
    tier4B = [[NSMutableArray alloc] init];
    tier4C = [[NSMutableArray alloc] init];
    tier4D = [[NSMutableArray alloc] init];
    tier4E = [[NSMutableArray alloc] init];
    tier4F = [[NSMutableArray alloc] init];
    tier4G = [[NSMutableArray alloc] init];
    tier4H = [[NSMutableArray alloc] init];
    tier4I = [[NSMutableArray alloc] init];
    tier4J = [[NSMutableArray alloc] init];
    tier5A = [[NSMutableArray alloc] init];
    tier5B = [[NSMutableArray alloc] init];
    tier5C = [[NSMutableArray alloc] init];
    tier5D = [[NSMutableArray alloc] init];
    tier5E = [[NSMutableArray alloc] init];
    tier5F = [[NSMutableArray alloc] init];
    tier5G = [[NSMutableArray alloc] init];
    tier6 = [[NSMutableArray alloc] init];
    currentTier = [[NSMutableArray alloc] init];
    
    
    for(int i = 0;i < [people count];i++){
        person = [[Person alloc] init];
        person = [people objectAtIndex:i];
        
        if([person.tier  isEqualToString:@"1"]){
            [tier1 addObject:person];
        }
        else if([person.tier  isEqualToString:@"2A"]){
            [tier2A addObject:person];
        }
        else if([person.tier  isEqualToString:@"2B"]){
            [tier2B addObject:person];
        }
        else if([person.tier  isEqualToString:@"2C"]){
            [tier2C addObject:person];
        }
        else if([person.tier  isEqualToString:@"2D"]){
            [tier2D addObject:person];
        }
        else if([person.tier  isEqualToString:@"3A"]){
            [tier3A addObject:person];
        }
        else if([person.tier  isEqualToString:@"3B"]){
            [tier3B addObject:person];
        }
        else if([person.tier  isEqualToString:@"3C"]){
            [tier3C addObject:person];
        }
        else if([person.tier  isEqualToString:@"3D"]){
            [tier3D addObject:person];
        }
        else if([person.tier  isEqualToString:@"3E"]){
            [tier3E addObject:person];
        }
        else if([person.tier  isEqualToString:@"3F"]){
            [tier3F addObject:person];
        }
        else if([person.tier  isEqualToString:@"3G"]){
            [tier3G addObject:person];
        }
        else if([person.tier  isEqualToString:@"3H"]){
            [tier3H addObject:person];
        }
        else if([person.tier  isEqualToString:@"3I"]){
            [tier3I addObject:person];
        }
        else if([person.tier  isEqualToString:@"3J"]){
            [tier3J addObject:person];
        }
        else if([person.tier  isEqualToString:@"4A"]){
            [tier4A addObject:person];
        }
        else if([person.tier  isEqualToString:@"4B"]){
            [tier4B addObject:person];
        }
        else if([person.tier  isEqualToString:@"4C"]){
            [tier4C addObject:person];
        }
        else if([person.tier  isEqualToString:@"4D"]){
            [tier4D addObject:person];
        }
        else if([person.tier  isEqualToString:@"4E"]){
            [tier4E addObject:person];
        }
        else if([person.tier  isEqualToString:@"4F"]){
            [tier4F addObject:person];
        }
        else if([person.tier  isEqualToString:@"4G"]){
            [tier4G addObject:person];
        }
        else if([person.tier  isEqualToString:@"4H"]){
            [tier4H addObject:person];
        }
        else if([person.tier  isEqualToString:@"4I"]){
            [tier4I addObject:person];
        }
        else if([person.tier  isEqualToString:@"4J"]){
            [tier4J addObject:person];
        }
        else if([person.tier  isEqualToString:@"5A"]){
            [tier5A addObject:person];
        }
        else if([person.tier  isEqualToString:@"5B"]){
            [tier5B addObject:person];
        }
        else if([person.tier  isEqualToString:@"5C"]){
            [tier5C addObject:person];
        }
        else if([person.tier  isEqualToString:@"5D"]){
            [tier5D addObject:person];
        }
        else if([person.tier  isEqualToString:@"5E"]){
            [tier5E addObject:person];
        }
        else if([person.tier  isEqualToString:@"5F"]){
            [tier5F addObject:person];
        }
        else if([person.tier  isEqualToString:@"5G"]){
            [tier5G addObject:person];
        }
        else if([person.tier  isEqualToString:@"6"]){
            [tier6 addObject:person];
        }
    }
    

    
    NSString *name;
    NSString *name2;
    NSUserDefaults *pref3 = [NSUserDefaults standardUserDefaults];
    if (![name isEqualToString:@" "]) {
        name = [pref3 stringForKey:@"name_preference"];
        NSArray *split = [name componentsSeparatedByString:@" "];
        name = split[0];
        name2 = split[1];
        name = [name uppercaseString];
        name2 = [name2 uppercaseString];
        
        name = [name stringByAppendingString:name2];
        
    }
    
    if([name  isEqualToString: @"SHAUNORR"]){
        [currentTier addObjectsFromArray:tier1];
        NSLog(@"%lu",(unsigned long)[currentTier count]);
        [currentTier addObjectsFromArray:tier2A];
        
        [currentTier addObjectsFromArray:tier2B];
        [currentTier addObjectsFromArray:tier2C];
        [currentTier addObjectsFromArray:tier2D];
        
        
        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:5]];
        [config addObject:[NSNumber numberWithInt:8]];
        [config addObject:[NSNumber numberWithInt:11]];
        [config addObject:[NSNumber numberWithInt:15]];
    }
    else if([name  isEqualToString: @"TAMMYEINERSON"]){

        
        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:4]];
        [config addObject:[NSNumber numberWithInt:9]];
        
    }
    else if([name  isEqualToString: @"MARILYNWALKER"]){
        
        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:4]];
        [config addObject:[NSNumber numberWithInt:7]];
        [config addObject:[NSNumber numberWithInt:11]];
    }
    else if([name  isEqualToString: @"ANDYBRADBURY"]){

        
        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:3]];
        [config addObject:[NSNumber numberWithInt:6]];
    }
    else if([name  isEqualToString: @"COREYRAMMELL"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:3]];
        [config addObject:[NSNumber numberWithInt:7]];
    }
    else if([name  isEqualToString: @"TERRYANDERSON"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"LORIPARKER"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"PUBLICHEALTH"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"LISANELSON"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"AREADIRECTOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:5]];
        [config addObject:[NSNumber numberWithInt:9]];
        [config addObject:[NSNumber numberWithInt:13]];
        
    }
    else if([name  isEqualToString: @"RUTHCLARK"]){
 
        [config addObject:[NSNumber numberWithInt:0]];
        
    }
    else if([name  isEqualToString: @"SHAWNANDREASEN"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:3]];
        [config addObject:[NSNumber numberWithInt:8]];
    }
    else if([name  isEqualToString: @"TIFFANYPAEPKE"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:4]];
        [config addObject:[NSNumber numberWithInt:8]];
        [config addObject:[NSNumber numberWithInt:13]];
    }
    else if([name  isEqualToString: @"STEPHANIEPOTTER"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:5]];
    }
    else if([name  isEqualToString: @"FRONTOFFICE"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"ASSISTANTAREADIRECTOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
       
    }
    else if([name  isEqualToString: @"ANGIEWATSON"]){

        [config addObject:[NSNumber numberWithInt:0]];
        [config addObject:[NSNumber numberWithInt:4]];
        [config addObject:[NSNumber numberWithInt:9]];
    }
    else if([name  isEqualToString: @"PHARMACYCOORDINATOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"PHARMACYTECH"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"CLINICALCARE"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"CLINICIANCOORDINATOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"CLINICIANAIDE"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"LABCOORDINATOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"RECEPTIONCOORDINATOR"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
    else if([name  isEqualToString: @"RECEPTIONIST"]){

        [config addObject:[NSNumber numberWithInt:0]];
    }
   
    
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
    if([currentTier count] == 0){
        return 1;
    }
    else{
        return [currentTier count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"healthCenterTree";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if([currentTier count] ==  0){
        cell.textLabel.text = @"Your";
        cell.detailTextLabel.text= @"Call List";
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.backgroundColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.userInteractionEnabled = YES;
    }
    else{
        NSLog(@"Flag");
        Person *contact = [[Person alloc] init];
        contact = [currentTier objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",contact.firstName,contact.lastName];
        cell.detailTextLabel.text = contact.number;
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.backgroundColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.userInteractionEnabled = YES;
        
        
        for(int i = 0;i < [config count];i++){
            if ([[config objectAtIndex:i] integerValue] == indexPath.row){
                cell.contentView.backgroundColor = [UIColor lightGrayColor];
                cell.textLabel.backgroundColor = [UIColor lightGrayColor];
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.detailTextLabel.backgroundColor = [UIColor lightGrayColor];
                cell.detailTextLabel.textColor = [UIColor whiteColor];
                cell.userInteractionEnabled = NO;
                cell.detailTextLabel.text = @"Call List";
            }
        }
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat number = 44.;

            for(int i = 0;i < [config count];i++ ){
                if ([[config objectAtIndex:i] integerValue] == indexPath.row){
                    number = 20.;
                }
            }
    
    return number;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
}




@end
