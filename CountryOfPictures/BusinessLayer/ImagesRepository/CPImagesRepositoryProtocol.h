#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

@protocol CPImageExternal;

/**
 The basic requirements for the implementation of the image loader.
 */
@protocol CPImagesRepositoryProtocol <NSObject>

/**
 Getting the list of images. Simulates the request to the server and returns a list of pictures in the interval from 3 to 8 seconds.
 
 @param count The number of required models.
 @return A promise represents the future value of a (usually) asynchronous task.
 */
- (BFTask<NSArray<id<CPImageExternal>> *> *)getImagesListWithCount:(NSUInteger)count cts:(BFCancellationTokenSource *)cts;

@end
