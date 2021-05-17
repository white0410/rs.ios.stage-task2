#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    for (int i = 0; i < numbersArray.count; i++) {
            if ([numbersArray[i] intValue] > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            } else if ([numbersArray[i] intValue] < 0) {
                return @"Negative numbers are not valid for input.";
            }
        }
        
        if (numbersArray.count == 4) {
            return [numbersArray componentsJoinedByString:@"."];
        } else if (numbersArray.count == 0) {
            return @"";
        }
        if (numbersArray.count > 4) {
            numbersArray = [numbersArray subarrayWithRange:NSMakeRange(0, 4)];
        }
        NSMutableString *result;
        result = [[numbersArray componentsJoinedByString:@"."] mutableCopy];
        for (int i = 0; i < 4 - numbersArray.count; i++) {
            [result appendString:@".0"];
        }
    return [result copy];
}

@end
