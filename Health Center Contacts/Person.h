//
//  Person.h
//  Health Center Contacts
//
//  Created by Jakob Hartman on 7/8/14.
//  Copyright (c) 2014 BYU-Idaho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,strong) NSString* firstName;
@property (nonatomic,strong) NSString* lastName;
@property (nonatomic,strong) NSString* dptEmail;
@property (nonatomic,strong) NSString* dptNumber;
@property (nonatomic,strong) NSString* imageName;
@property (nonatomic,strong) NSString* schEmail;
@property (nonatomic, strong) NSString* number;
@property (nonatomic, strong) NSString* position;
@property (nonatomic,strong) NSString* status;
@property (nonatomic,strong) NSString* tier;
@end
