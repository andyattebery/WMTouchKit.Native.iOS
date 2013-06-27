//
//  WMConfigurationManager.h
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/27/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMConfigurationManager : NSObject

+ (id)getInfoPlistObjectForKey:(NSString *)key;
+ (BOOL)hasInfoPlistKey:(NSString *)key;

@end
