//
//  Information.h
//  Health Center Contacts
//
//  Created by Jakob Hartman on 6/25/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Information : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *number;
@property (strong,nonatomic) NSMutableArray* people;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSMutableArray* collection;
@end
