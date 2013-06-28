//
//  WMWrapperViewController.m
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/25/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import "WMConfigurationManager.h"
#import "UIColor+Initialization.h"
#import "WMDocumentViewController.h"
#import "WMWrapperViewController.h"


#pragma mark - Constants

static NSString *const WrapperBaseProdURLKey = @"WMWrapperBaseProdURL";
static NSString *const WrapperBaseDevURLKey = @"WMWrapperBaseDevURL";
static NSString *const WrapperIsProdKey = @"WMWrapperIsProd";
static NSString *const WrapperApplicationURLSchemeKey = @"WMWrapperApplicationURLScheme";
static NSString *const WrapperDocumentURLEndpointKey = @"WMWrapperDocumentURLEndpoint";
static NSString *const JavascriptMarkAsWrapperKey = @"WMJavascriptMarkAsWrapper";
static NSString *const JavascriptGetPrimaryColorKey = @"WMJavascriptGetPrimaryColor";
static NSString *const JavascriptGetSecondaryColorKey = @"WMJavascriptGetSecondaryColor";
static NSString *const PrimaryColorKey = @"WMPrimaryColor";
static NSString *const SecondaryColorKey = @"WMSecondaryColor";


#pragma mark - Class Extensions

@interface WMWrapperViewController ()

+ (void)saveValueToNSUserDefaultsWithKey:(NSString *)nsUserDefaultsKey fromJavascriptInInfoPlistWithKey:(NSString*)infoPlistKey executedInWebView:(UIWebView*)webView;
+ (NSString *)getWrapperBaseURL;

@end


#pragma mark - Implementation

@implementation WMWrapperViewController

#pragma mark - Initialization

- (id)initWithDefaultURL
{
    self = [super initWithURL:[WMWrapperViewController getWrapperBaseURL] nibName:@"WMWrapperViewController" bundle:nil];
    if (self) {
        firstLoad = true;
    }
    return self;
}

- (id)initWithURL:(NSString*)URL
{
    self = [super initWithURL:URL nibName:@"WMWrapperViewController" bundle:nil];
    if (self) {
        firstLoad = true;
    }
    return self;
}


#pragma mark - UIWebViewDelegate Methods

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = [[request URL] absoluteString];
    
    // Ex. aspmobile://
    if ([WMConfigurationManager hasInfoPlistKey: WrapperApplicationURLSchemeKey])
    {
        // Ex. aspmobile://documents/
        if ([WMConfigurationManager hasInfoPlistKey:WrapperDocumentURLEndpointKey])
        {
            NSString *documentsURLEndpoint = [WMConfigurationManager getInfoPlistObjectForKey:WrapperDocumentURLEndpointKey];
            if (![documentsURLEndpoint hasSuffix:@"/"])
            {
                documentsURLEndpoint = [documentsURLEndpoint stringByAppendingString:@"/"];
            }
            
            NSString *documentsURLPrefix = [[WMConfigurationManager getInfoPlistObjectForKey:WrapperApplicationURLSchemeKey] stringByAppendingString:documentsURLEndpoint];
            if ([urlString hasPrefix:documentsURLPrefix])
            {
                NSString *documentURL = [urlString stringByReplacingOccurrencesOfString:documentsURLPrefix withString:self.baseURL];
                [self showDocument:documentURL];
                return NO;
            }
        }
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (firstLoad)
    {
        if ([WMConfigurationManager hasInfoPlistKey:JavascriptMarkAsWrapperKey])
        {
            [webView stringByEvaluatingJavaScriptFromString:[WMConfigurationManager getInfoPlistObjectForKey:JavascriptMarkAsWrapperKey]];
        }

        if ([WMConfigurationManager hasInfoPlistKey:JavascriptGetPrimaryColorKey])
        {
            [WMWrapperViewController saveValueToNSUserDefaultsWithKey:PrimaryColorKey fromJavascriptInInfoPlistWithKey:JavascriptGetPrimaryColorKey executedInWebView:webView];
        }
        
        if ([WMConfigurationManager hasInfoPlistKey:JavascriptGetSecondaryColorKey])
        {
            [WMWrapperViewController saveValueToNSUserDefaultsWithKey:SecondaryColorKey fromJavascriptInInfoPlistWithKey:JavascriptGetSecondaryColorKey executedInWebView:webView];
        }
        
        firstLoad = false;
    }
    
    [super webViewDidFinishLoad:webView];
}


#pragma mark - Document Methods

- (void) showDocument:(NSString*) documentURL
{
    WMDocumentViewController *documentView = [[WMDocumentViewController alloc] initWithURL:documentURL];
    documentView.primaryColor = [UIColor colorWithHexCode:[[NSUserDefaults standardUserDefaults] integerForKey:PrimaryColorKey]];
    documentView.secondaryColor = [UIColor colorWithHexCode:[[NSUserDefaults standardUserDefaults] integerForKey:SecondaryColorKey]];
    
    [self presentViewController:documentView animated:YES completion:nil];
}


#pragma mark - Class Extension Wrapper Methods

+ (void)saveValueToNSUserDefaultsWithKey:(NSString *)nsUserDefaultsKey fromJavascriptInInfoPlistWithKey:(NSString*)infoPlistKey executedInWebView:(UIWebView*)webView
{
    NSString *value = [webView stringByEvaluatingJavaScriptFromString:[WMConfigurationManager getInfoPlistObjectForKey:infoPlistKey]];
    unsigned hex;
    [[NSScanner scannerWithString:value] scanHexInt:&hex];
    [[NSUserDefaults standardUserDefaults] setInteger:hex forKey:nsUserDefaultsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getWrapperBaseURL
{
    NSString *baseURL = [[WMConfigurationManager getInfoPlistObjectForKey:WrapperIsProdKey] boolValue] ? [WMConfigurationManager getInfoPlistObjectForKey:WrapperBaseProdURLKey] :
        [WMConfigurationManager getInfoPlistObjectForKey:WrapperBaseDevURLKey];
    return [baseURL hasSuffix:@"/"] ? baseURL : [baseURL stringByAppendingString:@"/"];
}

@end
