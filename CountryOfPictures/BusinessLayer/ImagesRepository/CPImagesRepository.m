#import "CPImagesRepository.h"

#import <PromiseKit/PromiseKit.h>

#import "CPImage.h"

@implementation CPImagesRepository

- (AnyPromise *)getImagesListWithCount:(NSUInteger)count {
    return [AnyPromise promiseWithAdapterBlock:^(PMKAdapter  _Nonnull adapter) {
        // Simulating data download in the range from 3 to 8 seconds.
        NSInteger simulateTime = 3 + arc4random_uniform(5);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(simulateTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSMutableArray<CPImage *>* images = [NSMutableArray new];
            for (NSInteger i = 0; i < count; i++) {
                [images addObject:[CPImage new]];
            }
            adapter([images copy], nil);
        });
    }];
}

@end
