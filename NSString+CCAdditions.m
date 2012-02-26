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

- (NSString *)stringByDecodingHTMLEntities {
	NSUInteger myLength = [self length];
	NSUInteger ampIndex = [self rangeOfString:@"&" options:NSLiteralSearch].location;
	
	// Short-circuit if there are no ampersands.
	if (ampIndex == NSNotFound) {
		return self;
	}
	// Make result string with some extra capacity.
	NSMutableString *result = [NSMutableString stringWithCapacity:(myLength * 1.25)];
	
	// First iteration doesn't need to scan to & since we did that already, but for code simplicity's sake we'll do it again with the scanner.
	NSScanner *scanner = [NSScanner scannerWithString:self];
	
	[scanner setCharactersToBeSkipped:nil];
	
	NSCharacterSet *boundaryCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@" \t\n\r;"];
	
	do {
		// Scan up to the next entity or the end of the string.
		NSString *nonEntityString;
		if ([scanner scanUpToString:@"&" intoString:&nonEntityString]) {
			[result appendString:nonEntityString];
		}
		if ([scanner isAtEnd]) {
			goto finish;
		}
		// Scan either a HTML or numeric character entity reference.
		if ([scanner scanString:@"&amp;" intoString:NULL])
			[result appendString:@"&"];
		else if ([scanner scanString:@"&apos;" intoString:NULL])
			[result appendString:@"'"];
		else if ([scanner scanString:@"&quot;" intoString:NULL])
			[result appendString:@"\""];
		else if ([scanner scanString:@"&ldquo;" intoString:NULL])
			[result appendString:@"“"];
		else if ([scanner scanString:@"&rdquo;" intoString:NULL])
			[result appendString:@"”"];
		else if ([scanner scanString:@"&lsquo;" intoString:NULL])
			[result appendString:@"‘"];
		else if ([scanner scanString:@"&rsquo;" intoString:NULL])
			[result appendString:@"’"];
		else if ([scanner scanString:@"&lt;" intoString:NULL])
			[result appendString:@"<"];
		else if ([scanner scanString:@"&gt;" intoString:NULL])
			[result appendString:@">"];
		else if ([scanner scanString:@"&#" intoString:NULL]) {
			BOOL gotNumber;
			unsigned charCode;
			NSString *xForHex = @"";
			
			// Is it hex or decimal?
			if ([scanner scanString:@"x" intoString:&xForHex]) {
				gotNumber = [scanner scanHexInt:&charCode];
			}
			else {
				gotNumber = [scanner scanInt:(int*)&charCode];
			}
			
			if (gotNumber) {
				[result appendFormat:@"%C", charCode];
				[scanner scanString:@";" intoString:NULL];
			}
			else {
				NSString *unknownEntity = @"";				
				[scanner scanUpToCharactersFromSet:boundaryCharacterSet intoString:&unknownEntity];
				[result appendFormat:@"&#%@%@", xForHex, unknownEntity];
				//[scanner scanUpToString:@";" intoString:&unknownEntity];
				//[result appendFormat:@"&#%@%@;", xForHex, unknownEntity];
				NSLog(@"Expected numeric character entity but got &#%@%@;", xForHex, unknownEntity);
			}
			
		}
		else {
			NSString *amp;
			//an isolated & symbol
			[scanner scanString:@"&" intoString:&amp];
			[result appendString:amp];
		}
	}
	while (![scanner isAtEnd]);
	
finish:
	return result;
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

- (NSData *)dataValue; 
{
    return DataFromString(self);
}

NSData* DataFromString(NSString* aString)
{
    const char *utfString = [aString UTF8String];
    return [NSData dataWithBytes:utfString length:strlen(utfString)+1];
}

@end
