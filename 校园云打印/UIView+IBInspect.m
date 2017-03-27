//
//  UIView+IBInspect.m
//  card
//
//  Created by Hale Chan on 15/6/2.
//  Copyright (c) 2015年 Papaya Mobile Inc. All rights reserved.
//

#import "UIView+IBInspect.h"

@implementation UIView (IBInspect)
@dynamic layerBorderColor, layerBorderWidth, layerCornerRadius, layerShadowColor, layerShadowOffset, layerShadowOpacity, layerShadowRadius;

- (CGFloat)layerCornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius
{
    self.layer.cornerRadius = layerCornerRadius;
}

- (UIColor *)layerBorderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor
{
    self.layer.borderColor = layerBorderColor.CGColor;
}

- (CGFloat)layerBorderWidth
{
    return self.layer.borderWidth;
}

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth
{
    self.layer.borderWidth = layerBorderWidth;
}

- (UIColor *)layerShadowColor
{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setLayerShadowColor:(UIColor *)layerShadowColor
{
    self.layer.shadowColor = layerShadowColor.CGColor;
}

- (CGFloat)layerShadowOpacity
{
    return self.layer.shadowOpacity;
}

- (void)setLayerShadowOpacity:(CGFloat)layerShadowOpacity
{
    self.layer.shadowOpacity = layerShadowOpacity;
}

- (CGSize)layerShadowOffset
{
    return self.layer.shadowOffset;
}

- (void)setLayerShadowOffset:(CGSize)layerShadowOffset
{
    self.layer.shadowOffset = layerShadowOffset;
}

- (CGFloat)layerShadowRadius
{
    return self.layer.shadowRadius;
}

- (void)setLayerShadowRadius:(CGFloat)layerShadowRadius
{
    self.layer.shadowRadius = layerShadowRadius;
}

@end
