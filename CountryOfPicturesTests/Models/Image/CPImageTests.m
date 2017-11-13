#import <XCTest/XCTest.h>
#import "CPImage.h"

/**
 Unit tests of CPImage.
 */
@interface CPImageTests : XCTestCase

@end

@implementation CPImageTests

- (void)testInit {
    // given
    CPImage *image = [CPImage new];

    // then
    XCTAssertGreaterThan(image.width, 100);
    XCTAssertGreaterThan(image.height, 100);
    XCTAssertLessThan(image.width, 300);
    XCTAssertLessThan(image.height, 300);
    XCTAssertNotNil(image.url);
}

- (void)testInitWithWidthAndHeight {
    // given
    NSUInteger width = 100;
    NSUInteger height = 50;
    CPImage *image = [[CPImage alloc] initWithWidth:width
                                             height:height];

    // then
    XCTAssertEqual(image.width,
                   width);
    XCTAssertEqual(image.height,
                   height);
    XCTAssertEqualObjects(image.url,
                          [NSURL URLWithString:[NSString stringWithFormat:@"http://lorempixel.com/100/50/"]]);
}

@end
