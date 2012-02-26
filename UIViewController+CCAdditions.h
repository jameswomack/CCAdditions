//
//  UIViewController+CCAdditions.h
//  PocketConstitution
//
//  Created by James on 8/7/10.
//  Copyright 2010 Cirrostratus Design Company. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (CCAdditions)

- (UIBarButtonItem *)backButton;
- (UIBarButtonItem *)forwardButton; 
- (UIImage *)theImage;
- (void)popToRoot;
- (void)nextDocument;
- (id)vc:(NSString *)className;

@end
