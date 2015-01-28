//
//  EmployeeDetailsTableVC.h
//  Health Center Contacts
//
//  Created by chad eddington on 1/15/15.
//  Copyright (c) 2015 BYU-Idaho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

//Public variables

// Needed to be a type of object
@class EmployeeDetailsTableVC;

@protocol EmployeeDetailsTableVC <NSObject>
- (void)employeeDetailsGoBack:(EmployeeDetailsTableVC *)controller;

@end

@interface EmployeeDetailsTableVC : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) Person *contact;

@property (nonatomic,weak) id <EmployeeDetailsTableVC> delegate;
- (IBAction)back:(id)sender;

@end
