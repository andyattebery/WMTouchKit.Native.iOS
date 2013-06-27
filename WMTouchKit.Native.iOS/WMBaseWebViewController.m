//
//  WMWebViewController.m
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/26/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import "WMBaseWebViewController.h"

@interface WMBaseWebViewController ()

@end

@implementation WMBaseWebViewController

@synthesize webView;
@synthesize baseURL;

- (id)initWithURL:(NSString*)URL nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        baseURL = URL;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (webView != nil)
    {
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]]];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


@end
