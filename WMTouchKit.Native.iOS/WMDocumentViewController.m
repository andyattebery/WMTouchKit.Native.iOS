//
//  WMDocumentViewController.m
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/26/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import "WMDocumentViewController.h"

@interface WMDocumentViewController ()

@end

@implementation WMDocumentViewController

@synthesize navBar;
@synthesize buttonClose;
@synthesize primaryColor;
@synthesize secondaryColor;


- (id)initWithURL:(NSString*)URL
{
    self = [super initWithURL:URL nibName:@"WMDocumentViewController" bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    if (primaryColor != nil)
    {
        [navBar setTintColor: primaryColor];
    }
    
    if (secondaryColor != nil)
    {
        buttonClose.tintColor = secondaryColor;
    }
}

- (IBAction) close:(id) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
