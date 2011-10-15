    //
//  UIViewController+CCAdditions.m
//  PocketConstitution
//
//  Created by James on 8/7/10.
//  Copyright 2010 Cirrostratus Design Company. All rights reserved.
//

#import "UINavigationController+CCAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationController (CCAdditions)


- (void)altAnimatePopViewControllerAnimated:(BOOL)animated; {	
	UINavigationBar *bar = [[self.view subviews] objectAtIndex:2];
	ILogPlus(@"%@",[bar subviews]);
	int i = 0;
	while (i < [[bar subviews] count]) {
		NSString *classString = NSStringFromClass([[[bar subviews] objectAtIndex:i] class]);
		DLog(@"%@   %@",classString,@"UINavigationItemButtonView");
		if ([classString isEqualToString:@"UIButton"]) {
			[[[bar subviews] objectAtIndex:i] setAlpha:0];
		}
		i++;
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.5];
	i = 0;
	while (i < [[bar subviews] count]) {
		NSString *classString = NSStringFromClass([[[bar subviews] objectAtIndex:i] class]);
		DLog(@"%@   %@",classString,@"UINavigationItemButtonView");
		if ([classString isEqualToString:@"UIButton"]) {
			[[[bar subviews] objectAtIndex:i] setAlpha:1];
			//[[[bar subviews] objectAtIndex:i] setFrame:CGRectMake(5, 8, 27, 27)];
		}
		i++;
	}
	
	[UIView commitAnimations];
}




@end
