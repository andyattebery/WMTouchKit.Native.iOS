//
//  WMDocumentViewController.h
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/26/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMBaseWebViewController.h"

@interface WMDocumentViewController : WMBaseWebViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonClose;

@property (copy, nonatomic) UIColor *primaryColor;
@property (copy, nonatomic) UIColor *secondaryColor;

- (IBAction) close:(id) sender;
- (id)initWithURL:(NSString*)URL;

@end
