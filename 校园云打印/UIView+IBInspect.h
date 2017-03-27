//
//  UIView+IBInspect.h
//  card
//
//  Created by Hale Chan on 15/6/2.
//  Copyright (c) 2015年 Papaya Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IBInspect)

@property (nonatomic) IBInspectable CGFloat layerCornerRadius;
@property (nonatomic) IBInspectable UIColor *layerBorderColor;
@property (nonatomic) IBInspectable CGFloat layerBorderWidth;
@property (nonatomic) IBInspectable UIColor *layerShadowColor;
@property (nonatomic) IBInspectable CGFloat layerShadowOpacity;
@property (nonatomic) IBInspectable CGSize layerShadowOffset;
@property (nonatomic) IBInspectable CGFloat layerShadowRadius;

@end
