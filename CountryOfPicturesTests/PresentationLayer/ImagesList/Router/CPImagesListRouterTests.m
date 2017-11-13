#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "CPImagesListRouter.h"

/**
 Unit tests of CPImagesListRouter.
 */
@interface CPImagesListRouterTests : XCTestCase

@property (nonatomic, strong) CPImagesListRouter *router;

@end

@implementation CPImagesListRouterTests

- (void)setUp {
    [super setUp];

    self.router = [[CPImagesListRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
