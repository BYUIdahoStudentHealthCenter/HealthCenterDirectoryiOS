//
//  Settings.m
//  Health Center Contacts
//
//  Created by Jakob Hartman on 7/23/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import "Settings.h"
#import <Firebase/Firebase.h>
#import <FirebaseSimpleLogin/FirebaseSimpleLogin.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "Person.h"

@interface Settings ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UILabel *numContactsLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadCycle;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property (strong,nonatomic) NSMutableArray *people;
@end

@implementation Settings
@synthesize userName;
@synthesize people;
@synthesize loadCycle;
@synthesize numContactsLabel;
@synthesize errorMessage;

Firebase* myRef;
FirebaseSimpleLogin* authClient;
Person *person;
NSInteger *count;
NSUserDefaults *prefs;

-(void) viewDidLoad{
    prefs = [NSUserDefaults standardUserDefaults];
    loadCycle.hidden = YES;
    errorMessage.hidden = YES;
    
    userName.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"name_preference"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == userName){
        [textField resignFirstResponder];
    }
    return NO;
}
- (IBAction)sync:(id)sender {
    myRef = [[Firebase alloc]initWithUrl:@"https://boiling-fire-7455.firebaseio.com/Employee"];
    authClient = [[FirebaseSimpleLogin alloc] initWithRef:myRef];
        loadCycle.hidden = NO;
        [loadCycle startAnimating];
    [authClient loginWithEmail:@"byuishcfacebook@gmail.com" andPassword:@"Innovation!"
           withCompletionBlock:^(NSError* error, FAUser* user) {
               
               if (error) {
                   NSLog(@"Fail");
                   [loadCycle stopAnimating];
                   errorMessage.hidden = NO;
               }
               else if(user) {
                   [myRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
                       NSDictionary *item = [[NSDictionary alloc] initWithDictionary:snapshot.value];
                       [prefs setObject:item forKey:@"contacts"];
                       
                       NSArray * allKeys = [item allKeys];
                       count = (NSInteger *)[allKeys count];
                       numContactsLabel.text = [NSString stringWithFormat:@"%lu",  (unsigned long)count];
                       [loadCycle stopAnimating];
                   }];
                   NSLog(@"Success");
               }
           }];
}


- (IBAction)changeNameSettings:(id)sender {
    NSString *text = userName.text;
    NSUserDefaults *pref3 = [NSUserDefaults standardUserDefaults];
    [pref3 setObject:text forKey:@"name_preference"];
    
    if([userName.text length] == 0){
        text = @"Default User";
        userName.text = @"Default User";
        [pref3 setObject:text forKey:@"name_preference"];
    }
}
@end
