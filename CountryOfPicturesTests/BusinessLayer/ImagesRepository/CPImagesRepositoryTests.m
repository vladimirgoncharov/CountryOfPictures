#import <XCTest/XCTest.h>

#import <PromiseKit/PromiseKit.h>
#import "CPImagesRepository.h"
#import "CPImage.h"

/**
 Unit tests of CPImagesRepository.
 */
@interface CPImagesRepositoryTests : XCTestCase

@property (nonatomic, strong) CPImagesRepository *instance;

@end

@implementation CPImagesRepositoryTests

- (void)setUp {
    [super setUp];

    self.instance = [CPImagesRepository new];
}

- (void)tearDown {
    self.instance = nil;

    [super tearDown];
}

#pragma mark - CPImagesRepositoryProtocol

- (void)testGetImagesListWithZeroCount {
    // given
    NSUInteger imagesCount = 0;
    XCTestExpectation *expectation = [self expectationWithDescription:@"Getting zero images"];
    
    // when
    AnyPromise *promise = [self.instance getImagesListWithCount:imagesCount];
    
    // then
    promise.then(^(NSMutableArray<CPImage *>* images) {
        XCTAssertEqual(images.count,
                       imagesCount);
        [expectation fulfill];
    });
    [self waitForExpectationsWithTimeout:10
                                 handler:nil];
}

- (void)testGetImagesListWithFiveCount {
    // given
    NSUInteger imagesCount = 5;
    XCTestExpectation *expectation = [self expectationWithDescription:@"Getting five images"];

    // when
    AnyPromise *promise = [self.instance getImagesListWithCount:imagesCount];

    // then
    promise.then(^(NSMutableArray<CPImage *>* images) {
        XCTAssertEqual(images.count,
                       imagesCount);
        [expectation fulfill];
    });
    [self waitForExpectationsWithTimeout:10
                                 handler:nil];
}

@end
