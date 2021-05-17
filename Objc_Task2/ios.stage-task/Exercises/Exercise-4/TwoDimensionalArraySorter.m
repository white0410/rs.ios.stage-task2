#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array.count == 0 || !array || ![array[0] isKindOfClass:NSArray.class]) {
            return @[];
        }
        NSMutableArray *res = [NSMutableArray array];
        NSMutableArray *nums = [NSMutableArray array];
        NSMutableArray *strings = [NSMutableArray array];
        for (int i = 0; i < array.count; i++) {
            if ([array[i][0] isKindOfClass:NSNumber.class]) {
                [nums addObjectsFromArray:array[i]];
            } else {
                [strings addObjectsFromArray:array[i]];
            }
        }
        if (nums.count > 0) {
            nums = [[nums sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
            if (strings.count == 0) {
                return [nums copy];
            }
        }
        if (strings.count > 0) {
            strings = [[strings sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
            if (nums.count == 0) {
                return [strings copy];
            }
        }
        [res addObject:[nums copy]];
        [res addObject:[[strings reverseObjectEnumerator] allObjects]];
    
    return [res copy];
    
}

@end
