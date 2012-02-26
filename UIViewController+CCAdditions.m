    //
//  UIViewController+CCAdditions.m
//
//  Created by James on 8/7/10.
//  Copyright 2010 Cirrostratus Design Company. All rights reserved.
//

#import "UIViewController+CCAdditions.h"

@interface ArrowButton : UIButton

- (void)drawRect:(CGRect)rect;

@end

@implementation ArrowButton

- (void)drawRect:(CGRect)rect; {
	UIBezierPath* path = [UIBezierPath bezierPath];
	[path moveToPoint:CGPointMake(8.0f, 13.0f)];
	[path addLineToPoint:CGPointMake(24.0f, 4.0f)];
	[path addLineToPoint:CGPointMake(24.0f, 22.0f)];
	[[UIColor whiteColor] setFill];
	[path closePath];
	[path fill];
}

@end


@implementation UIViewController (CCAdditions)


- (UIImage *)theImage; {
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL,27,27,8,0,
												 colorSpace,kCGImageAlphaPremultipliedLast);
	CFRelease(colorSpace);
	
	// set the fill color
	CGColorRef fillColor = [[UIColor whiteColor] CGColor];
	CGContextSetFillColor(context, CGColorGetComponents(fillColor));
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 8.0f, 13.0f);
	CGContextAddLineToPoint(context, 24.0f, 4.0f);
	CGContextAddLineToPoint(context, 24.0f, 22.0f);
	CGContextClosePath(context);
	CGContextFillPath(context);
	
	
	
	// convert the context into a CGImageRef
	CGImageRef image = CGBitmapContextCreateImage(context);
	CGContextRelease(context);
	
	UIImage *backImage = [[UIImage alloc] initWithCGImage:image];
	CGImageRelease(image);
	return [backImage autorelease];
}

- (UIBarButtonItem *)backButton; {

	ArrowButton *button = [ArrowButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, 27, 27);
    [button addTarget:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
	
	return [backButton autorelease];
}

- (UIBarButtonItem *)forwardButton; {

    ArrowButton *button = [ArrowButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, 27, 27);
    [button addTarget:self action:@selector(nextDocument) forControlEvents:UIControlEventTouchUpInside];
	button.transform = CGAffineTransformMakeScale(-1, 1);
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
	
	return [backButton autorelease];
}

- (void)popToRoot; {

	[self.navigationController popViewControllerAnimated:YES];
}
- (void)nextDocument; {
	
}

- (id)vc:(NSString *)className; {
    Class vcClass = NSClassFromString(className);
    id vc = [[vcClass alloc] initWithNibName:className bundle:nil];
    return [vc autorelease];
}

@end
