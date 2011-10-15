//
//  UIView+CCAdditions.m
//  FreeAppsDaily
//
//  Created by James Womack on 3/25/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import "UIView+CCAdditions.h"


@implementation UIView (CCAdditions)
- (BOOL)findAndResignFirstResponder; {
	/*http://stackoverflow.com/questions/1823317/how-do-i-legally-get-the-current-first-responder-on-the-screen-on-an-iphone
	Thomas Müller
	*/
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;     
    }
    for (UIView *subView in self.subviews) {
        if ([subView findAndResignFirstResponder])
            return YES;
    }
    return NO;
}
@end
