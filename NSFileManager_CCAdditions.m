#if TARGET_OS_IPHONE
#import "NSFileManager_CCAdditions.h"

@implementation NSFileManager (CCAdditions)

- (BOOL)createDirectoryIfNecessary:(NSString *)directory; {
	BOOL isDir = NO;
	if ([self fileExistsAtPath:directory isDirectory:&isDir] && isDir) return YES;
	if ([self fileExistsAtPath:directory isDirectory:&isDir] && !isDir) return NO;
	
	return [self createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL];
}

@end
#endif
