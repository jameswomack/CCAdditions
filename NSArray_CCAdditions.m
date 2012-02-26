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

- (NSArray*)arrayOfObjectsAtKeyPath:(NSString*)aKeyPath;
{
    NSMutableArray *ma = [[NSMutableArray new] autorelease];
    for (NSObject *obj in self) 
    {
        id objAtKP = [obj valueForKeyPath:aKeyPath];
        if (objAtKP)
            [ma addObject:objAtKP];
    }
    return [NSArray arrayWithArray:ma];
}


@end
