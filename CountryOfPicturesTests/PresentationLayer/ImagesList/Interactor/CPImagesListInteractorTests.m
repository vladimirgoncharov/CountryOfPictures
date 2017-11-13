#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <PromiseKit/PromiseKit.h>

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
    AnyPromise *promise = [AnyPromise promiseWithAdapterBlock:^(PMKAdapter  _Nonnull adapter) {
        NSMutableArray<CPImage *>* images = [NSMutableArray new];
        for (NSInteger i = 0; i < 10; i++) {
            [images addObject:[CPImage new]];
        }
        adapter([images copy], nil);
    }];
    
    // when
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promise);
    [self.interactor fetchImages];
    
    // then
    promise.then(^() {
        OCMVerify([self.mockOutput didFetchImagesSuccessful:promise.value]);
    });
}

- (void)testFetchImagesFailed {
    // give
    AnyPromise *promise = [AnyPromise promiseWithAdapterBlock:^(PMKAdapter  _Nonnull adapter) {
       NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                            code:NSURLErrorUnknown
                                        userInfo:nil];
        adapter(nil, error);
    }];
    
    // when
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promise);
    [self.interactor fetchImages];
    
    // then
    promise.then(^() {
        OCMVerify([self.mockOutput didFetchImagesFail:promise.value]);
    });
}

- (void)testFetchImagesSuccesfulWhenPromiseIsExist {
    // give
    void(^adapterBlock)(PMKAdapter  _Nonnull adapter) = ^void(PMKAdapter  _Nonnull adapter) {
        NSMutableArray<CPImage *>* images = [NSMutableArray new];
        for (NSInteger i = 0; i < 10; i++) {
            [images addObject:[CPImage new]];
        }
        adapter([images copy], nil);
    };
    AnyPromise *promiseFirst = [AnyPromise promiseWithAdapterBlock:adapterBlock];
    AnyPromise *promiseLast = [AnyPromise promiseWithAdapterBlock:adapterBlock];
    
    // when
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promiseFirst);
    [self.interactor fetchImages];
    
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promiseLast);
    [self.interactor fetchImages];
    
    // then
    promiseFirst.then(^() {
        OCMReject([self.mockOutput didFetchImagesSuccessful:promiseFirst.value]);
    });
    promiseLast.then(^() {
        OCMVerify([self.mockOutput didFetchImagesSuccessful:promiseLast.value]);
    });
}

- (void)testFetchImagesFailWhenPromiseIsExist {
    // give
    void(^adapterBlock)(PMKAdapter  _Nonnull adapter) = ^void(PMKAdapter  _Nonnull adapter) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain
                                             code:NSURLErrorUnknown
                                         userInfo:nil];
        adapter(nil, error);
    };
    AnyPromise *promiseFirst = [AnyPromise promiseWithAdapterBlock:adapterBlock];
    AnyPromise *promiseLast = [AnyPromise promiseWithAdapterBlock:adapterBlock];
    
    // when
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promiseFirst);
    [self.interactor fetchImages];
    
    OCMExpect([self.mockImagesRepository getImagesListWithCount:51]).andReturn(promiseLast);
    [self.interactor fetchImages];
    
    // then
    promiseFirst.then(^() {
        OCMReject([self.mockOutput didFetchImagesSuccessful:promiseFirst.value]);
    });
    promiseLast.then(^() {
        OCMVerify([self.mockOutput didFetchImagesSuccessful:promiseLast.value]);
    });
}

@end
