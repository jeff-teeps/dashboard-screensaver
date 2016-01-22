//
//  DashboardView.m
//  Dashboard
//
//  Created by Jeff Klarfeld on 1/22/16.
//  Copyright © 2016 Teeps. All rights reserved.
//

#import "DashboardView.h"
@import WebKit;

@interface DashboardView ()
{
    CGFloat red;
    CGFloat blue;
    CGFloat green;
}

@property (strong, nonatomic) WebView *webView;

@end

@implementation DashboardView

#pragma mark – Initialization

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self)
    {
        [self setup];
    }
    return self;
}

#pragma mark – Setup

- (void)setup
{
    [self setAnimationTimeInterval:1/60.0];
    
    red = blue = green = 0.0;
}

#pragma mark – Animation

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)animateOneFrame
{
    red += 0.01;
    blue += 0.01;
    green += 0.01;
    
    if (red > 1 || ((int)(red * 100) % 2) > 0)
    {
        red = 0;
    }
    
    if (green > 1)
    {
        green = 0;
    }
    
    if (blue > 1)
    {
        blue = 0;
    }
    
    CALayer *newLayer = [CALayer layer];
    [newLayer setBackgroundColor:CGColorCreateGenericRGB(red, green, blue, 1.0)];
    [self setWantsLayer:YES];
    [self setLayer:newLayer];
    
    return;
}

#pragma mark – Drawing

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

#pragma mark – Instance Methods

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
