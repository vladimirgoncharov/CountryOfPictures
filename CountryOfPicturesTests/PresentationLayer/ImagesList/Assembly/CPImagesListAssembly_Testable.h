#import "CPImagesListAssembly.h"

@class CPImagesListViewController;
@class CPImagesListInteractor;
@class CPImagesListPresenter;
@class CPImagesListRouter;

/**
 Extension makes private factory methods open for testing.
 */
@interface CPImagesListAssembly ()

- (CPImagesListViewController *)viewImagesList;
- (CPImagesListPresenter *)presenterImagesList;
- (CPImagesListInteractor *)interactorImagesList;
- (CPImagesListRouter *)routerImagesList;

@end
