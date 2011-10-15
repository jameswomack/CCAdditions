//
//  UIImageView+CCAdditions.m
//  MyMeasures
//
//  Created by James on 9/8/10.
//  Copyright 2010 Cirrostratus Design Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+CCAdditions.h"


@implementation UIImageView (CCAdditions)


+ (UIImageView *)imageViewWithContentsOfFile:(NSString *)file cornerRadius:(NSInteger)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width {
	UIImageView *imageView = [[[self alloc] initWithImage:[UIImage imageNamed:file]] autorelease];
    imageView.layer.cornerRadius = radius;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderColor = color.CGColor;
    imageView.layer.borderWidth = width;
	imageView.contentMode = UIViewContentModeCenter;
	return imageView;
}

+ (UIImageView *)measuresImageViewWithContentsOfFile:(NSString *)file {
	return [self imageViewWithContentsOfFile:file cornerRadius:4 borderColor:[UIColor grayColor] borderWidth:2.0f];
}

@end
