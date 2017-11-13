#import <XCTest/XCTest.h>
#import "CPImageCollectionCell.h"
#import "CPImageCollectionCell_Testable.h"

/**
 Unit tests of CPImageCollectionCell.
 */
@interface CPImageCollectionCellTests : XCTestCase

@property (nonatomic, strong) CPImageCollectionCell *instance;

@end

@implementation CPImageCollectionCellTests

- (void)setUp {
    [super setUp];
    self.instance = [[CPImageCollectionCell alloc] initWithFrame:CGRectMake(10,
                                                                            5,
                                                                            300,
                                                                            200)];
}

- (void)tearDown {
    self.instance = nil;
    [super tearDown];
}

#pragma mark - Methods

- (void)testInitWithFrame {
    //then
    XCTAssertNotNil(self.instance.imageView);
    XCTAssertTrue(CGRectEqualToRect(self.instance.bounds,
                                    self.instance.imageView.bounds));
}

- (void)testUpdateConstraints {
    // before
    XCTAssertTrue(CGRectEqualToRect(self.instance.bounds,
                                    self.instance.imageView.bounds));

    // when
    [self.instance setFrame:CGRectMake(20,
                                       10,
                                       400,
                                       350)];
    [self.instance setNeedsUpdateConstraints];
    [self.instance layoutIfNeeded];

    // then
    XCTAssertTrue(CGRectEqualToRect(self.instance.bounds,
                                    self.instance.imageView.bounds));
}

- (void)testPrepareForReuse {
    // before
    XCTAssertNil(self.instance.imageView.image);

    // when
    self.instance.imageView.image = [UIImage new];
    self.instance.imageView.backgroundColor = [UIColor redColor];
    self.instance.imageView.layer.cornerRadius = 0;
    [self.instance prepareForReuse];

    // then
    XCTAssertNil(self.instance.imageView.image);
}

@end
