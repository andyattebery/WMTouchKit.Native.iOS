//
//  WMConfigurationManager.m
//  WMTouchKit.Native.iOS
//
//  Created by Andy Attebery on 6/27/13.
//  Copyright (c) 2013 West Monroe Partners. All rights reserved.
//

#import "WMConfigurationManager.h"


@implementation WMConfigurationManager

#pragma mark - General NSUserDefaults Methods

+ (id)getInfoPlistObjectForKey:(NSString *)key
{
    id value = [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
    if (value == nil)
    {
        @throw ([NSException exceptionWithName:@"InfoDictionary Missing Key" reason:[NSString stringWithFormat:@"NSUserDefaults missing key: %@", key] userInfo:nil]);
    }
    
    return value;
}

+ (BOOL)hasInfoPlistKey:(NSString *)key
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:key] != nil;
}

@end
