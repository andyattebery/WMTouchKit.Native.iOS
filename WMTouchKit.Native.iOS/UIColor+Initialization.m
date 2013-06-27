//
//  UIColor+Initialization.m
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/27/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import "UIColor+Initialization.h"

const int RedMask = 0xFF0000;
const int GreenMask = 0x00FF00;
const int BlueMask = 0x0000FF;


@implementation UIColor (Initialization)

+ (UIColor*) colorWithHexCode:(int)code
{
    int red = (code & RedMask) >> 16;
    int green = (code & GreenMask) >> 8;
    int blue = code & BlueMask;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
