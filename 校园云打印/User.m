//
//  User.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "User.h"

@interface User () <NSCoding>

@end

@implementation User

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_userID forKey:@"userID"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_gender forKey:@"gender"];
    [aCoder encodeObject:_age forKey:@"age"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.userID = [aDecoder decodeObjectForKey:@"userID"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}

@end
