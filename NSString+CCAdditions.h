//
//  NSObject+Additions.h
//  LaJollaBluebook
//
//  Created by James Womack on 5/15/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CCAdditions) 
- (BOOL)notNilOrNull;

+ (id)ellipsis;

- (NSString *)stringWithEllipsisByTruncatingToLength:(NSUInteger)length; 
- (NSString *)stripTags;
/*!
 * @method URLEncodedString
 * @result ￼
 */
- (NSString*) URLEncodedString;

/*!
 * @method  minimalURLEncodedString
 * @result ￼
 */
- (NSString*) minimalURLEncodedString;

/*!
 * @method  URLDecodedString
 * @result ￼
 */
- (NSString*) URLDecodedString;

- (NSString*)stringCleanedOfExtraWhitespace;

+ (NSString *)coordinateStringFromDouble:(double)theDouble;

+ (NSString *)spanStringFromDouble:(double)theDouble; 

- (NSData *)dataValue; 

- (NSString *)stringByDecodingHTMLEntities;

NSData* DataFromString(NSString* aString);

@end
