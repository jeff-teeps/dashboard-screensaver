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
    
    NSScreen *mainScreen = [NSScreen mainScreen];
    _webView = [[WebView alloc] initWithFrame:mainScreen.frame];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(webViewFinished:)
                                                 name:WebViewProgressFinishedNotification
                                               object:nil];
    
    [_webView.mainFrame loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://teepsdashing.herokuapp.com"]]];
    
    [self addSubview:_webView];
    _webView.hidden = YES;
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
    NSScreen *mainScreen = [NSScreen mainScreen];
    _webView.frame = mainScreen.frame;
    
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

- (void)webViewFinished:(NSNotificationCenter *)notification
{
    NSLog(@"webViewFinished: %@", notification);
    
    _webView.hidden = NO;
}

@end
