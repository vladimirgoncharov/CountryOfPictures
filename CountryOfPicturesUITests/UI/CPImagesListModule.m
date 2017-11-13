#import <XCTest/XCTest.h>

@interface CPImagesListModule : XCTestCase

@property (nonatomic, strong) XCUIApplication *application;

@end

@implementation CPImagesListModule

- (void)setUp {
    [super setUp];
    self.application = [[XCUIApplication alloc] init];
    [self.application launch];
}

- (void)tearDown {
    [self.application terminate];
    self.application = nil;
    [super tearDown];
}

#pragma mark - UI Tests

- (void)testLoadOfImages {
    // Checking progress view.
    XCUIElement *progressHUD = [self.application otherElements][@"SVProgressHUD"];
    [self waitForElementToAppear:progressHUD
                     withTimeout:3.0];

    // Waiting cells.
    XCUIElement *collectionView = [self.application collectionViews].firstMatch;
    NSPredicate *cellsPredicate = [NSPredicate predicateWithFormat:@"cells.count > 0"];
    [self waitForElement:collectionView
           withPredicate:cellsPredicate
             withTimeout:10.0];
}

#pragma mark - Helpers

- (void)waitForElementToAppear:(XCUIElement *)element
                   withTimeout:(NSTimeInterval)timeout {
    NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
    [self waitForElement:element
           withPredicate:existsPredicate
             withTimeout:timeout];
}

- (void)waitForElement:(XCUIElement *)element
         withPredicate:(NSPredicate *)predicate
           withTimeout:(NSTimeInterval)timeout {
    NSUInteger line = __LINE__;
    NSString *file = [NSString stringWithUTF8String:__FILE__];
    
    [self expectationForPredicate:predicate evaluatedWithObject:element handler:nil];
    
    [self waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSString *message = [NSString stringWithFormat:@"Failed to find %@ after %f seconds", element, timeout];
            [self recordFailureWithDescription:message inFile:file atLine:line expected:YES];
        }
    }];
}

@end
