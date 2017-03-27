//
//  NSString+Phone.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/25.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "NSString+Phone.h"

@implementation NSString (Phone)


- (BOOL)isValidPhoneNumber {
    
    NSError *error = nil;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:@"^1[3|4|5|7|8][0-9]\\d{8}$" options:0 error:&error];
    if (error) {
        NSLog(@"error- %@", error);
        return NO;
    }
    return [reg matchesInString:self options:0 range:NSMakeRange(0, self.length)].count > 0;
}
@end
