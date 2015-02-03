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
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *numContactsLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadCycle;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property (strong,nonatomic) NSMutableArray *people;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel;
@property (weak, nonatomic) UITextField *activeTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;
@end

@implementation Settings
@synthesize userName;
@synthesize password;
@synthesize people;
@synthesize loadCycle;
@synthesize numContactsLabel;
@synthesize errorMessage;
@synthesize activeTextField;
@synthesize theScrollView;

Firebase* myRef;
FirebaseSimpleLogin* authClient;
Person *person;
NSInteger *count;
NSUserDefaults *prefs;

-(void) viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Sync";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    prefs = [NSUserDefaults standardUserDefaults];
    loadCycle.hidden = YES;
    errorMessage.hidden = YES;
    userName.layer.borderColor=[[UIColor grayColor] CGColor];
    userName.layer.borderWidth = 1.0f;
    userName.layer.cornerRadius=8.0f;
    
    password.layer.cornerRadius=8.0f;
    password.layer.borderWidth = 1;
    password.layer.borderColor=[[UIColor grayColor] CGColor];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == userName){
        [textField resignFirstResponder];
    }
    return NO;
}
- (IBAction)sync:(id)sender {
    NSString *loginUsername = userName.text;
    NSString *loginPassword = password.text;
    
    myRef = [[Firebase alloc]initWithUrl:@"https://boiling-fire-7455.firebaseio.com/Employee"];
    authClient = [[FirebaseSimpleLogin alloc] initWithRef:myRef];
        loadCycle.hidden = NO;
        [loadCycle startAnimating];
    [authClient loginWithEmail:loginUsername andPassword:loginPassword
           withCompletionBlock:^(NSError* error, FAUser* user) {
               
               if (error) {
                   NSLog(@"Fail");
                   [loadCycle stopAnimating];
                   errorMessage.hidden = NO;
               }
               else if(user) {
                   [myRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
                       NSDictionary *item = [[NSDictionary alloc] initWithDictionary:snapshot.value];
                       [prefs removeObjectForKey:@"contacts"];
                       [prefs setObject:item forKey:@"contacts"];
                       NSLog(@"Number of items in the firebase %ld", [item count]);
                       [prefs synchronize];
                       
                       
                       NSArray * allKeys = [item allKeys];
                       count = (NSInteger *)[allKeys count];
                       numContactsLabel.text = [NSString stringWithFormat:@"%lu",  (unsigned long)count];
                       [loadCycle stopAnimating];
                       
                       [item enumerateKeysAndObjectsUsingBlock:^(id key, id object, bool *stop) {
                           // Links @ to parameters
                          // NSLog(@"%@ = %@", key, object);
                       }];
                   }];
                   NSLog(@"Success");
                   
                   // Timer
                   //
                   [NSTimer scheduledTimerWithTimeInterval:1.0
                            target:self
                                                  selector:@selector(timerCalled)
                                                  userInfo:nil
                                                   repeats:NO
                    ];
                   
               }
           }];
    
}

- (void) timerCalled {
    [self performSegueWithIdentifier:@"goHome" sender:self];

}

- (IBAction)cancel:(id)sender {
    [self performSegueWithIdentifier:@"goHome" sender:self];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.activeTextField = nil;
}

-(IBAction)dismissKeyboard {
   // [self.activeTextField resignFirstResponder];
    [self.view endEditing:YES];

}

-(void) keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    theScrollView.contentInset = contentInsets;
    theScrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWasShown:(NSNotification *)notification {
    //Get the size of the keyboard
    //
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Adjust the bottom content inset of your scroll view by the keyboard height
    //
    UIEdgeInsets contentInsets =  UIEdgeInsetsMake(0.0,0.0,keyboardSize.height,0.0);
    theScrollView.contentInset = contentInsets;
    theScrollView.scrollIndicatorInsets = contentInsets;
    
    //Scroll the target text field into view

    CGRect aRect = self.view.bounds;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activeTextField.frame.origin.y - (keyboardSize.height - 15));
        [theScrollView setContentOffset:scrollPoint animated:YES];
    }
}


@end
