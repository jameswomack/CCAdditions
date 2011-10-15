//
//  NSMutableArray+CCAdditions.m
//  ToDo
//
//  Created by James Womack on 6/27/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import "NSMutableArray+CCAdditions.h"


@implementation NSMutableArray (CCAdditions)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    if (to != from) {
        id obj = [self objectAtIndex:from];
        [obj retain];
        [self removeObjectAtIndex:from];
        if (to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
        [obj release];
    }
}

- (void)removeDuplicates; {
    NSArray *copy = [self copy];
	NSInteger index = [copy count] - 1;
	for (id object in [copy reverseObjectEnumerator]) {
		if ([self indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound) {
			[self removeObjectAtIndex:index];
		}
		index--;
	}
	[copy release];
}

@end
