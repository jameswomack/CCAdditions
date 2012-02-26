//
//  UITableView+CCAdditions.m
//  VuHunt
//
//  Created by James Womack on 1/23/12.
//  Copyright (c) 2012 Cirrostratus Co. All rights reserved.
//

#import "UITableView+CCAdditions.h"

@implementation UITableView (CCAdditions)

- (void)scrollToTop
{
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
