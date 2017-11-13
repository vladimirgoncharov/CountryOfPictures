#import "CPImagesListAssembly.h"

#import "CPImagesListViewController.h"
#import "CPImagesListInteractor.h"
#import "CPImagesListPresenter.h"
#import "CPImagesListRouter.h"
#import "CPImagesRepository.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation CPImagesListAssembly

- (CPImagesListViewController *)viewImagesList {
    return [TyphoonDefinition withClass:[CPImagesListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterImagesList]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterImagesList]];
                          }];
}

- (CPImagesListInteractor *)interactorImagesList {
    return [TyphoonDefinition withClass:[CPImagesListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterImagesList]];
                              [definition injectProperty:@selector(imagesRepository)
                                                    with:[self imagesRepository]];
                          }];
}

- (CPImagesListPresenter *)presenterImagesList {
    return [TyphoonDefinition withClass:[CPImagesListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewImagesList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorImagesList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerImagesList]];
                          }];
}

- (CPImagesListRouter *)routerImagesList {
    return [TyphoonDefinition withClass:[CPImagesListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewImagesList]];
                          }];
}

- (CPImagesRepository *)imagesRepository {
    return [TyphoonDefinition withClass:[CPImagesRepository class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopePrototype;
                          }];
}

@end
