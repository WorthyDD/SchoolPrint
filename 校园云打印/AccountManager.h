//
//  AccountManager.h
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface AccountManager : NSObject

@property (nonatomic) NSMutableArray<User *> *users;
@property (nonatomic) User *currentUser;

+ (instancetype)shareManager;

- (void)saveData;
- (void)readData;

- (BOOL)vertifyUsername:(NSString *)userID password:(NSString *)password;

- (void)registUser:(User *)user completion:(void(^)(BOOL success, NSString *errorMsg))completionHandler;

@end


extern NSString *kLoginSuccessNotification;
