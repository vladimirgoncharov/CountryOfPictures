#import <XCTest/XCTest.h>

#import <Bolts/Bolts.h>
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
    
    // when
    BFTask<NSArray<id<CPImageExternal>> *> *promise = [self.instance getImagesListWithCount:imagesCount cts:nil];
    [promise waitUntilFinished];
    
    // then
    XCTAssertEqual(promise.result.count,
                   imagesCount);
}

- (void)testGetImagesListWithFiveCount {
    // given
    NSUInteger imagesCount = 5;

    // when
    BFTask<NSArray<id<CPImageExternal>> *> *promise = [self.instance getImagesListWithCount:imagesCount cts:nil];
    [promise waitUntilFinished];

    // then
    XCTAssertEqual(promise.result.count,
                   imagesCount);
}

@end
