//
//  CCFileManagement.h
//  Convertible
//
//  Created by James on 3/1/11.
//  Copyright 2011 Cirrostratus Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PathAppend(appendTo,appendage) [appendTo stringByAppendingPathComponent:appendage]
#define Doogie(docsSubdir) PathAppend([CCFileManagement documentsDirectory], docsSubdir)

@interface CCFileManagement : NSObject


+ (NSString *)documentsDirectory;
+ (NSString *)conversionsDirectory;
+ (NSString *)fullPathFromRelativePath:(NSString*)relPath;
+ (NSString *)createDirectoryAtPath:(NSString *)thePath;

@end
