
#import "NSDictionary+CCAdditions.h"

@implementation NSDictionary (CCAdditions)

- (id)obj:(id)key {
	return [self objectForKey:key];
}

- (BOOL)containsAllKeys:(NSArray *)arrayOfKeys; {
    for (NSString *key in arrayOfKeys) {
        if(![self objectForKey:key])
            return NO;
    }
    return YES;
}


@end