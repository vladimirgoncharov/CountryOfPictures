#import "CPImagesRepositoryProtocol.h"

/**
 The implementation of the image loader.
 */
@interface CPImagesRepository : NSObject <CPImagesRepositoryProtocol>

@property (nonatomic, assign) BOOL simulateDelay;

@end
