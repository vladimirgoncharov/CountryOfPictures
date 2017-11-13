#import <Foundation/Foundation.h>

@class AnyPromise;

/**
 The basic requirements for the implementation of the image loader.
 */
@protocol CPImagesRepositoryProtocol

/**
 Getting the list of images. Simulates the request to the server and returns a list of pictures in the interval from 3 to 8 seconds.

 @param count The number of required models.
 @return A promise represents the future value of a (usually) asynchronous task.
 */
- (AnyPromise *)getImagesListWithCount:(NSUInteger)count;

@end
