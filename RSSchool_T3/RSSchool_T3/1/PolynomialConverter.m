#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
        if ([numbers count] == 0) return nil;
        NSMutableString *result = [NSMutableString stringWithString:@""];
        
        if ([numbers count] == 1) {
            [result appendFormat:@"%d", [numbers[0] intValue]];
            return result;
        }
        else {
            switch ([[numbers firstObject] intValue]) {
                case 1:
                    [result appendString:@"x"];
                    break;
                case -1:
                    [result appendString:@"-x"];
                    break;
                            
                default:
                    [result appendFormat:@"%dx", [[numbers firstObject] intValue]];
                    break;
            }
            if ([numbers count] != 2) [result appendFormat: @"^%lu", [numbers count] - 1];
        
            for (int i = 1; i < [numbers count] - 1; i++) {
                if ([numbers[i] intValue] > 0) [result appendString:@" + "];
                else if ([numbers[i] intValue] < 0)[result appendString:@" - "];
                
                switch ([numbers[i] intValue]) {
                    case 1:
                    case -1:
                        [result appendString:@"x"];
                        if (i != [numbers count] - 2) [result appendFormat: @"^%lu", [numbers count] - i - 1];
                        break;
                    case 0:
                        break;
                        
                    default:
                        [result appendFormat:@"%dx", abs([numbers[i] intValue])];
                        if (i != [numbers count] - 2) [result appendFormat: @"^%lu", [numbers count] - i - 1];
                        break;
                }
            }
            if ([[numbers lastObject] intValue] > 0)
                [result appendFormat:@" + %d", abs([[numbers lastObject] intValue])];
            else if ([[numbers lastObject] intValue] < 0)
                [result appendFormat:@" - %d", abs([[numbers lastObject] intValue])];
            
            return result;
        }
    }
@end
