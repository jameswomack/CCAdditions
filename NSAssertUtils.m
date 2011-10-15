//
//  NSAssertUtils.m
//  VuHunt
//
//  Created by James Womack on 8/30/11.
//  Copyright (c) 2011 Cirrostratus Co. All rights reserved.
//

#import "NSAssertUtils.h"

@implementation NSAssertUtils

+ (void)stringsinArray:(NSArray *)theArray; {
    for(NSString *s in theArray) {
        assert(s != nil);
    }
}

+ (BOOL)cleanArray:(NSArray *)theArray; {
    for(NSString *s in theArray) {
        if(!s)
            return NO;
    }
    return YES;
}

@end
