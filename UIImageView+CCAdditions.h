//
//  UIImageView+CCAdditions.h
//  MyMeasures
//
//  Created by James on 9/8/10.
//  Copyright 2010 Cirrostratus Design Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImageView (CCAdditions)

+ (UIImageView *)imageViewWithContentsOfFile:(NSString *)file cornerRadius:(NSInteger)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width;
+ (UIImageView *)measuresImageViewWithContentsOfFile:(NSString *)file;

@end
