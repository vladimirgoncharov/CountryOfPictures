#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <Bolts/Bolts.h>

#import "CPImagesListViewController.h"
#import "CPImagesListViewController_Testable.h"
#import "CPImagesListViewOutput.h"
#import "CPImage.h"

@interface CPImagesListViewControllerTests : XCTestCase

@property (nonatomic, strong) CPImagesListViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation CPImagesListViewControllerTests

- (void)setUp {
    [super setUp];

    self.controller = [[CPImagesListViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(CPImagesListViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Life cycle

- (void)testLoadView {
    // when
    [self.controller loadViewIfNeeded];
    
    // then
    XCTAssertNotNil(self.controller.collectionView);
    XCTAssertNotNil(self.controller.pullToRefreshView);
}

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Actions

- (void)testRefreshAction {
    // when
    [self.controller refresh:self.controller.pullToRefreshView];
    
    // then
    OCMVerify([self.mockOutput pullDownToRefresh]);
}

#pragma mark - CPImagesListViewInput

- (void)testSetupInitialState {
    // when
    [self.controller loadViewIfNeeded];
    [self.controller setupInitialState];

    // then
    XCTAssertNotNil(self.controller.collectionView.dataSource);
    XCTAssertNotNil(self.controller.collectionView.delegate);
}

- (void)testReloadImages {
    // given
    NSMutableArray<id<CPImageExternal> >* images = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        [images addObject:[CPImage new]];
    }

    // when
    [self.controller loadViewIfNeeded];
    [self.controller reloadImages:images];

    // then
    XCTAssertEqual(self.controller.images,
                   images);
    XCTAssertEqual([self.controller collectionView:self.controller.collectionView
                            numberOfItemsInSection:0],
                   images.count);
}

- (void)testShowProgress {
    // when
    [self.controller loadViewIfNeeded];
    [self.controller showProgressView];

    // then
    XCTestExpectation *showExpectation = [self expectationWithDescription:@"Show progress bar"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqual([SVProgressHUD isVisible], YES);
        [showExpectation fulfill];
    });
    [self waitForExpectationsWithTimeout:1.0
                                 handler:nil];
}

- (void)testDismissProgress {
    // when
    [self.controller loadViewIfNeeded];
    [self.controller showProgressView];
    
    // then
    XCTestExpectation *showExpectation = [self expectationWithDescription:@"Show progress bar"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqual([SVProgressHUD isVisible], YES);
        [showExpectation fulfill];
    });
    [self waitForExpectationsWithTimeout:1.0
                                 handler:nil];

    // when
    [self.controller dismissProgressView];
    
    // then
    XCTestExpectation *dismissExpectation = [self expectationWithDescription:@"Dismiss progress bar"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqual([SVProgressHUD isVisible], NO);
        [dismissExpectation fulfill];
    });
    [self waitForExpectationsWithTimeout:1.0
                                 handler:nil];
}

@end
