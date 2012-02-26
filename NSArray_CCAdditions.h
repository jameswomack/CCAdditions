@interface NSArray (CCAdditions)

- (BOOL)isValidIndex:(NSUInteger)anIndex;
- (BOOL)containsObjectOfClass:(Class)aClass; 
- (NSArray*)arrayOfObjectsAtKeyPath:(NSString*)aKeyPath;

@end
