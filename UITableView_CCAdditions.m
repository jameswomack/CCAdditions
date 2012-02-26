
#if TARGET_OS_IPHONE
#import "UITableView_CCAdditions.h"

@implementation UITableView (CCAdditions)

- (UIColor *)separatorColor; {
	return HEXCOLOR(0x777777);
}

- (UITableViewCellSeparatorStyle)separatorStyle; {
	return UITableViewCellSeparatorStyleSingleLine;
}

@end
#endif
