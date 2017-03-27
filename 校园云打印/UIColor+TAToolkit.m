//
//  UIColor+TAToolkit.m
//  TAToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Tips4app Inc. All rights reserved.
//

#import "UIColor+TAToolkit.h"

static short hexCharToShort(char a)
{
    if (a >= '0' && a <= '9') {
        return a - '0';
    }
    else if( a>='a' && a<='f') {
        return a - 'a' + 10;
    }
    else if( a>= 'A' && a<='F') {
        return a - 'A' + 10;
    }
    else {
        return -1;
    }
}

@implementation UIColor(TAToolkit)

+ (UIColor *)colorWithARGB:(u_int32_t)argb
{
    return [UIColor colorWithRed:((argb&0xff0000)>>16)/255.0 green:((argb&0xff00)>>8)/255.0 blue:(argb&0xff)/255.0 alpha:(argb>>24)/255.0];
}

+ (UIColor *)colorWithRGB:(u_int32_t)rgb alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:(rgb>>16)/255.0 green:((rgb&0x00ff00)>>8)/255.0 blue:(rgb&0x0000FF)/255.0 alpha:alpha];
}

+ (UIColor *)colorWithRGBA:(u_int32_t)rgba
{
    return [UIColor colorWithRed:(rgba>>24)/255.0 green:((rgba&0xff0000)>>16)/255.0 blue:((rgba&0xff00)>>8)/255.0 alpha:(rgba&0xff)/255.0];
}

+ (UIColor *)colorWithRGB:(u_int32_t)rgb
{
    return [UIColor colorWithRed:((rgb&0xff0000)>>16)/255.0 green:((rgb&0xff00)>>8)/255.0 blue:(rgb&0xff)/255.0 alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSString *colorString;
    if ([hexString hasPrefix:@"#"]) {
        colorString = [hexString substringFromIndex:1];
    }
    else {
        colorString = hexString;
    }
    
    CGFloat r,g,b,a;
    
    switch (colorString.length) {
        case 3:{
            r = hexCharToShort([colorString characterAtIndex:0]) / (float)0xF;
            g = hexCharToShort([colorString characterAtIndex:1]) / (float)0xF;
            b = hexCharToShort([colorString characterAtIndex:2]) / (float)0xF;
            a = 1.0;
        }
            break;
        case 4:{
            r = hexCharToShort([colorString characterAtIndex:0]) / (float)0xF;
            g = hexCharToShort([colorString characterAtIndex:1]) / (float)0xF;
            b = hexCharToShort([colorString characterAtIndex:2]) / (float)0xF;
            a = hexCharToShort([colorString characterAtIndex:3]) / (float)0xF;
        }
            break;
        case 6:{
            r = (hexCharToShort([colorString characterAtIndex:0])*0x10 + hexCharToShort([colorString characterAtIndex:1])) / (float)0xFF;
            g = (hexCharToShort([colorString characterAtIndex:2])*0x10 + hexCharToShort([colorString characterAtIndex:3])) / (float)0xFF;
            b = (hexCharToShort([colorString characterAtIndex:4])*0x10 + hexCharToShort([colorString characterAtIndex:5])) / (float)0xFF;
            a = 1.0;
        }
            break;
        case 8:{
            r = (hexCharToShort([colorString characterAtIndex:0])*0x10 + hexCharToShort([colorString characterAtIndex:1])) / (float)0xFF;
            g = (hexCharToShort([colorString characterAtIndex:2])*0x10 + hexCharToShort([colorString characterAtIndex:3])) / (float)0xFF;
            b = (hexCharToShort([colorString characterAtIndex:4])*0x10 + hexCharToShort([colorString characterAtIndex:5])) / (float)0xFF;
            a = (hexCharToShort([colorString characterAtIndex:6])*0x10 + hexCharToShort([colorString characterAtIndex:7])) / (float)0xFF;
        }
            break;
        default:
            return nil;
            break;
    }
    
    return [self colorWithRed:r green:g blue:b alpha:a];
}

- (NSString *)hexString
{
    int r,g,b;
    CGFloat red, green, blue, alpha;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    r = red * (float)0xff;
    g = green * (float)0xff;
    b = blue * (float)0xff;
    
    return [NSString stringWithFormat:@"#%.2x%.2x%.2x", r, g, b];
}

@end
