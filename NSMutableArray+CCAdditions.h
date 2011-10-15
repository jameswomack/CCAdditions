//
//  NSMutableArray+CCAdditions.h
//  ToDo
//
//  Created by James Womack on 6/27/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (CCAdditions)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;
- (void)removeDuplicates;

@end
