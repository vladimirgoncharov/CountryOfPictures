#import "CPImagesListInteractor.h"

#import <Bolts/Bolts.h>

#import "CPImagesListInteractorOutput.h"
#import "CPImagesRepositoryProtocol.h"
#import "CPImageExternal.h"

@interface CPImagesListInteractor()

@property (nonatomic, strong) BFCancellationTokenSource *cts;

@end

@implementation CPImagesListInteractor

#pragma mark - CPImagesListInteractorInput

- (void)fetchImages {
    // canceling current promise
    if (self.cts) {
        [self.cts cancel];
        self.cts = nil;
    }
    
    // running new load
    __weak typeof(self) wself = self;
    self.cts = [BFCancellationTokenSource new];
    [[self.imagesRepository getImagesListWithCount:51 cts:self.cts] continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id _Nullable(BFTask<NSArray<id<CPImageExternal>> *> * _Nonnull t) {
        __strong typeof(wself) sself = wself;
        if (sself) {
            if (t.result) {
                [sself.output didFetchImagesSuccessful:t.result];
            } else if (t.error) {
                [sself.output didFetchImagesFail:t.error];
            }
        }
        return [BFTask taskWithResult:nil];
    }];
}

@end
