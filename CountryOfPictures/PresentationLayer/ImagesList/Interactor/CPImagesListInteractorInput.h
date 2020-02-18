#import <Foundation/Foundation.h>

@class BFTask;
/**
 Basic requirements for Interactor of ImagesList module.
 */
@protocol CPImagesListInteractorInput <NSObject>

/**
 Start process for downloading new images.
 */
- (void)fetchImages;

@end
