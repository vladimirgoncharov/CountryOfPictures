#import "CPBusinessAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "CPImagesRepository.h"

@implementation CPBusinessAssembly

- (id<CPImagesRepositoryProtocol>)imagesRepository {
    return [TyphoonDefinition withClass:[CPImagesRepository class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(simulateDelay) with:@(YES)];
    }];
}

@end
