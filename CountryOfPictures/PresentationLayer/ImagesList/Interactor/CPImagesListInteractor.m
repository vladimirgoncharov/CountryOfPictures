#import "CPImagesListInteractor.h"

#import <PromiseKit/PromiseKit.h>

#import "CPImagesListInteractorOutput.h"
#import "CPImagesRepositoryProtocol.h"
#import "CPImage.h"

@interface CPImagesListInteractor()

@property (nonatomic, strong) AnyPromise *imagesPromise;

@end

@implementation CPImagesListInteractor

#pragma mark - CPImagesListInteractorInput

- (void)fetchImages {
    // canceling current promise
    if (self.imagesPromise) {
        self.imagesPromise.then(^() {
            @throw [NSError cancelledError];
        });
    }

    // running new load
    __weak typeof(self) wself = self;
    self.imagesPromise = [self.imagesRepository getImagesListWithCount:51];
    self.imagesPromise.then(^(NSMutableArray<CPImage *>* images) {
        __strong typeof(wself) sself = wself;
        if (sself) {
            [sself.output didFetchImagesSuccessful:images];
        }
    }).catch(^(NSError *error) {
        __strong typeof(wself) sself = wself;
        if (sself) {
            [sself.output didFetchImagesFail:error];
        }
    }).always(^() {
        __strong typeof(wself) sself = wself;
        if (sself) {
            sself.imagesPromise = nil;
        }
    });
}

@end
