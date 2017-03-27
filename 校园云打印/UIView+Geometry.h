//
//  UIView+Geometry.h
//  PPYToolkit
//
//  Created by Hale Chan on 14-6-30.
//  Copyright (c) 2014年 Tips4app Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Geometry)

@property (nonatomic) CGFloat x;

@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

- (void) printFrame;

@end
