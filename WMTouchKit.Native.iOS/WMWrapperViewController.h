//
//  WMWrapperViewController.h
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/25/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMBaseWebViewController.h"

@interface WMWrapperViewController : WMBaseWebViewController<UIWebViewDelegate>
{
    BOOL firstLoad;
}

- (id)initWithDefaultURL;
- (id)initWithURL:(NSString*)URL;
- (void) showDocument:(NSString*) documentURL;

@end
