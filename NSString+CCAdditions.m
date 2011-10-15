//
//  NSObject+Additions.m
//  LaJollaBluebook
//
//  Created by James Womack on 5/15/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import "NSString+CCAdditions.h"


@implementation NSString (CCAdditions)
- (BOOL)notNilOrNull; {
	return (self && ![self isEqual:[NSNull null]] && ![self isEqualToString:@"<null>"]);
}
+ (id)ellipsis {
	return [NSString stringWithUTF8String:"\xE2\x80\xA6"];
}

- (NSString *)stringWithEllipsisByTruncatingToLength:(NSUInteger)length; {
	NSString *returnString;
	
	if (length < [self length]) {
		//Truncate and append the ellipsis
		returnString = [[self substringToIndex:length-1] stringByAppendingString:[NSString ellipsis]];
	} else {
		//We don't need to truncate, so don't append an ellipsis
		returnString = [[self copy] autorelease];
	}
	
	return returnString;
}

- (NSString *)stripTags; {
	NSMutableString *html = [NSMutableString stringWithCapacity:[self length]];
	
	NSScanner *scanner = [NSScanner scannerWithString:self];
	NSString *tempText = nil;
	
	while (![scanner isAtEnd])
	{
		[scanner scanUpToString:@"<" intoString:&tempText];
		
		if (tempText != nil)
			[html appendString:tempText];
		
		[scanner scanUpToString:@">" intoString:NULL];
		
		if (![scanner isAtEnd])
			[scanner setScanLocation:[scanner scanLocation] + 1];
		
		tempText = nil;
	}
	
	return html;
}
- (NSString*) URLEncodedString  {
	
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           CFSTR("!*'();:@&=+$,/?#[]"),
                                                                           kCFStringEncodingUTF8);
    return [result autorelease];
}

- (NSString*) minimalURLEncodedString  {
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           CFSTR("%"),             
                                                                           CFSTR("?=&+"),          
                                                                           kCFStringEncodingUTF8); 
    return [result autorelease];
}

- (NSString*) URLDecodedString {
    NSString *result = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                           (CFStringRef)self,
                                                                                           CFSTR(""),
                                                                                           kCFStringEncodingUTF8);
    [result autorelease];
    return result;  
}

- (NSString*)stringCleanedOfExtraWhitespace; {	
	NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
	
	NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
	NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
	return [filteredArray componentsJoinedByString:@" "];
}

+ (NSString *)coordinateStringFromDouble:(double)theDouble; {
    NSString *d = String(@"%.6f",theDouble);
    return [d stringByReplacingOccurrencesOfString:@"." withString:@""];
}

+ (NSString *)spanStringFromDouble:(double)theDouble; {
    NSString *d = String(@"%.4f",theDouble);
    return [d stringByReplacingOccurrencesOfString:@"." withString:@""];
}

@end
