#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Bolts/Bolts.h>

#import "CPImagesListInteractor.h"
#import "CPImage.h"

#import "CPImagesListInteractorOutput.h"
#import "CPImagesRepositoryProtocol.h"

/**
 Unit tests of CPImagesListInteractor.
 */
@interface CPImagesListInteractorTests : XCTestCase

@property (nonatomic, strong) CPImagesListInteractor *interactor;

@property (nonatomic, strong) id mockOutput;
@property (nonatomic, strong) id mockImagesRepository;

@end

@implementation CPImagesListInteractorTests

- (void)setUp {
    [super setUp];

    self.interactor = [[CPImagesListInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(CPImagesListInteractorOutput));
    self.mockImagesRepository = OCMProtocolMock(@protocol(CPImagesRepositoryProtocol));

    self.interactor.output = self.mockOutput;
    self.interactor.imagesRepository = self.mockImagesRepository;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;
    self.mockImagesRepository = nil;

    [super tearDown];
}

#pragma mark - CPImagesListInteractorInput

- (void)testFetchImagesSuccesful {
    // give
    id value = [NSObject new];
    BFTask *promise = [BFTask taskWithResult:value];
    
    // when
    OCMStub([self.mockImagesRepository getImagesListWithCount:51 cts:OCMOCK_ANY]).andReturn(promise);
    [self.interactor fetchImages];
    
    // then
    OCMVerify([self.mockOutput didFetchImagesSuccessful:value]);
    OCMReject([self.mockOutput didFetchImagesFail:OCMOCK_ANY]);
}

- (void)testFetchImagesFailed {
    // give
    NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                         code:NSURLErrorUnknown
                                     userInfo:nil];
    BFTask *promise = [BFTask taskWithError:error];
    
    // when
    OCMStub([self.mockImagesRepository getImagesListWithCount:51 cts:OCMOCK_ANY]).andReturn(promise);
    [self.interactor fetchImages];

    // then
    OCMReject([self.mockOutput didFetchImagesSuccessful:OCMOCK_ANY]);
    OCMVerify([self.mockOutput didFetchImagesFail:error]);
}

@end
