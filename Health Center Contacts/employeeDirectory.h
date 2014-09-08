//
//  employeeDirectory.h
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/27/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface employeeDirectory : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate>
@property (strong,nonatomic) NSMutableArray* people;
@end
