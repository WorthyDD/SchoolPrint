//
//  UIColor+TAToolkit.h
//  TAToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Tips4app Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(TAToolkit)
+ (UIColor *)colorWithARGB:(u_int32_t)argb;
+ (UIColor *)colorWithRGB:(u_int32_t)rgb alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBA:(u_int32_t)rgba;
+ (UIColor *)colorWithRGB:(u_int32_t)rgb;

/**
 *  根据十六进制串生成颜色
 *
 *  @param hexString 一个十六进制字符串，支持的格式有：
 *  <ul>
 *  <li> #RGB </li>
 *  <li> #RGBA </li>
 *  <li> #RRGGBB </li>
 *  <li> #RRGGBBAA </li>
 *  <li> RGB </li>
 *  <li> RGBA </li>
 *  <li> RRGGBB </li>
 *  <li> RRGGBBAA </li>
 *  </ul>
 *
 *  @return 一个UIColor实例
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
- (NSString *)hexString;

@end
