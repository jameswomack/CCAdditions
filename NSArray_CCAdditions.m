#import "NSArray_CCAdditions.h"

@implementation NSArray (CCAdditions)

- (BOOL)isValidIndex:(NSUInteger)anIndex; {
	return anIndex < [self count];
}

- (BOOL)containsObjectOfClass:(Class)aClass; {
	for (id obj in self) {
		if ([obj isKindOfClass:aClass])
			return YES;
	}
	return NO;
}


@end
