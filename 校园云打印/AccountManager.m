//
//  AccountManager.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "AccountManager.h"

static NSString *kAccountData =@"Account_user_path_key";
NSString *kLoginSuccessNotification = @"login_success_noti";

@implementation AccountManager

+(instancetype)shareManager {
    static AccountManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AccountManager alloc] init];
        manager.users = [NSMutableArray new];
    });
    return manager;
}

- (void)saveData {
    if (_users.count > 0) {
        
        NSMutableData *data = [NSMutableData new];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:_users forKey:kAccountData];
        [archiver finishEncoding];
        BOOL success = [data writeToFile:[self path] atomically:YES];
        if (success) {
            NSLog(@"写入成功！");
        }
        else {
            NSLog(@"写入数据失败");
        }
    }
}

- (void)readData {
    
    NSData *data = [NSData dataWithContentsOfFile:[self path]];
    if (!data) {
        return;
    }
    NSKeyedUnarchiver *unarch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSArray *arr = [unarch decodeObjectForKey:kAccountData];
    if (arr.count > 0) {
        _users = [NSMutableArray arrayWithArray:arr];
        NSLog(@"读入数据成功， 共%ld条数据！", _users.count);
    }
}

- (NSString *)path {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Library/data"];
}

- (BOOL)vertifyUsername:(NSString *)userID password:(NSString *)password {
    
    for(User *user in _users) {
        if ([user.name isEqualToString:userID] &&
            [user.password isEqualToString:password]) {
            _currentUser = user;
            [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessNotification object:nil];
            return YES;
        }
    }
    return NO;
}

- (void)registUser:(User *)user completion:(void (^)(BOOL, NSString *))completionHandler {
    
    for (User *u in _users) {
        if ([u.name isEqualToString:user.name]) {
            completionHandler(NO, @"该用户名已注册！");
            return;
        }
        else if ([u.phone isEqualToString:user.phone]) {
            completionHandler(NO, @"该手机号已注册！");
            return;
        }
    }
    [_users addObject:user];
    _currentUser = user;
    completionHandler(YES, nil);
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginSuccessNotification object:nil];
    [self saveData];
}

@end
