#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CPImagesListPresenter.h"

#import "CPImagesListViewInput.h"
#import "CPImagesListInteractorInput.h"
#import "CPImagesListRouterInput.h"
#import "CPImage.h"

@interface CPImagesListPresenterTests : XCTestCase

@property (nonatomic, strong) CPImagesListPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation CPImagesListPresenterTests

- (void)setUp {
    [super setUp];

    self.presenter = [[CPImagesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(CPImagesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(CPImagesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(CPImagesListViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - CPImagesListModuleInput

- (void)testConfigureModule {}

#pragma mark - CPImagesListViewOutput

- (void)testDidTriggerViewReadyEvent {
    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
    OCMVerify([self.mockView showProgressView]);
    OCMVerify([self.mockInteractor fetchImages]);
}

- (void)testPullDownToRefresh {
    // when
    [self.presenter pullDownToRefresh];
    
    // then
    OCMVerify([self.mockView showProgressView]);
    OCMVerify([self.mockInteractor fetchImages]);
}

#pragma mark - CPImagesListInteractorOutput

- (void)testDidFetchImagesSuccessful {
    // given
    NSMutableArray<CPImage *>* images = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        [images addObject:[CPImage new]];
    }

    // when
    [self.presenter didFetchImagesSuccessful:images];

    // then
    OCMVerify([self.mockView dismissProgressView]);
    OCMVerify([self.mockView dismissPullToRefreshView]);
    OCMVerify([self.mockView reloadImages:images]);
}

- (void)testDidFetchImagesFail {
    // given
    NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                         code:NSURLErrorUnknown
                                     userInfo:nil];

    // when
    [self.presenter didFetchImagesFail:error];

    // then
    OCMVerify([self.mockView dismissProgressView]);
    OCMVerify([self.mockView dismissPullToRefreshView]);
    OCMVerify([self.mockView showError:error]);
}

@end
