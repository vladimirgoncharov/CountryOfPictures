#import "CPImagesListAssembly.h"

@protocol CPImagesRepositoryProtocol;

/**
 Extension makes private factory methods open for testing.
 */
@interface CPBusinessAssembly ()

- (id<CPImagesRepositoryProtocol>)imagesRepository;

@end
