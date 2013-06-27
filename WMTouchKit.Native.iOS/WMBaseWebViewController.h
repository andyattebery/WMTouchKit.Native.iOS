//
//  WMWebViewController.h
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/26/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMBaseWebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) NSString *baseURL;

- (id)initWithURL:(NSString*)URL nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
