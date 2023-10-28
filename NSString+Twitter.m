#import "NSString+Twitter.h"

@implementation NSString (Twitter)
-(int)TWTwitterCharacterCountWithShortenedURLLength:(int)urlLen {
 /* may be slightly inaccurate */
 NSError *err;
 NSDataDetector *dataDetector = [[NSDataDetector alloc]initWithTypes:NSTextCheckingTypeLink error:&err];
 NSMutableString *ourString = [self mutableCopy];
 NSUInteger thisMethodGetsTheLengthButIDontThinkItEverEvenUsesItLol = [ourString length];
 NSArray *matches = [dataDetector matchesInString:ourString options:nil range:nil];
 long long matchesCount = [matches count];
 unsigned long httpsCount = 0;
 unsigned long httpCount = 0;
 if (matchesCount > 0) {
  for (NSTextCheckingResult *match in matches) {
   if ([match resultType] == NSTextCheckingTypeLink) {
    if ([[[match URL]scheme]compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
     httpsCount += 1;
     [[[match range] replaceCharactersInRange:@"https" withString:@""];
    } else if ([[[match URL]scheme]compare:@"http" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
     httpCount += 1;
     [[match range] replaceCharactersInRange:@"http" withString:@""];
    }
   }
  }
 }
 return [[ourString precomposedStringWithCanonicalMapping]length] + httpCount * urlLen + (urlLen + 1) * httpsCount;
}
@end
