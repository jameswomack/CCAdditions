//
//  CCFileManagement.m
//  Convertible
//
//  Created by James on 3/1/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import "CCFileManagement.h"


@implementation CCFileManagement

+ (NSString *)documentsDirectory; {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths objectAtIndex:0];
}

+ (NSString *)conversionsDirectory; {
    return [CCFileManagement createDirectoryAtPath:[[CCFileManagement documentsDirectory] stringByAppendingPathComponent:@"conversions"]];
}

+ (NSString *)createDirectoryAtPath:(NSString *)thePath; {
    NSString *path = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL dirExists = [fileManager fileExistsAtPath:thePath isDirectory:&isDir];
    if(!dirExists) {
        NSError *error = nil;
        if(![fileManager createDirectoryAtPath:thePath withIntermediateDirectories:YES attributes:nil error:&error])
            ILogPlus(@"failed to create dir");
    }
	path = thePath;
    return path;
}

+ (NSString *)fullPathFromRelativePath:(NSString*)relPath; {
	// do not convert an absolute path (starting with '/')
	if(([relPath length] > 0) && ([relPath characterAtIndex:0] == '/'))	{
		return relPath;
	}
	
	NSMutableArray *imagePathComponents = [NSMutableArray arrayWithArray:[relPath pathComponents]];
	NSString *file = [imagePathComponents lastObject];
	
	[imagePathComponents removeLastObject];
	NSString *imageDirectory = [NSString pathWithComponents:imagePathComponents];
	
	NSString *fullpath = [[NSBundle mainBundle] pathForResource:file
																					   ofType:nil
																				  inDirectory:imageDirectory];
	if (fullpath == nil)
		fullpath = relPath;
	
	return fullpath;	
}

@end
