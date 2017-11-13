#import "CPImagesListPresenter.h"

#import "CPImagesListViewInput.h"
#import "CPImagesListInteractorInput.h"
#import "CPImagesListRouterInput.h"

@implementation CPImagesListPresenter

#pragma mark - CPImagesListModuleInput

- (void)configureModule {}

#pragma mark - CPImagesListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self loadImages];
}

- (void)pullDownToRefresh {
    [self loadImages];
}

#pragma mark - CPImagesListInteractorOutput

- (void)didFetchImagesSuccessful:(NSArray<CPImage *> *)images {
    [self.view dismissProgressView];
    [self.view dismissPullToRefreshView];
    [self.view reloadImages:images];
}

- (void)didFetchImagesFail:(NSError *)error {
    [self.view dismissProgressView];
    [self.view dismissPullToRefreshView];
    [self.view showError:error];
}

#pragma mark - Helpers

- (void)loadImages {
    [self.view showProgressView];
    [self.interactor fetchImages];
}

@end
