#import "CPImagesRepository.h"

#import "CPImage.h"

@implementation CPImagesRepository

- (BFTask<NSArray<id<CPImageExternal>> *> *)getImagesListWithCount:(NSUInteger)count cts:(BFCancellationTokenSource *)cts {
    BFTaskCompletionSource *tcs = [BFTaskCompletionSource new];
    dispatch_block_t imagesBlock = ^{
        if (cts.isCancellationRequested) {
            [tcs cancel];
        } else {
            NSMutableArray<id<CPImageExternal>> *images = [NSMutableArray new];
            for (NSInteger i = 0; i < count; i++) {
                [images addObject:[CPImage new]];
            }
            [tcs setResult:[images copy]];
        }
    };
    if (self.simulateDelay) {
        NSInteger simulateTime = 3;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(simulateTime * NSEC_PER_SEC)), dispatch_get_main_queue(), imagesBlock);
    } else {
        imagesBlock();
    }
    return tcs.task;
}

@end
