#import <Foundation/Foundation.h>

@protocol CPImageExternal;

/**
 Basic requirements for Presenter's Interactor of ImagesList module.
 */
@protocol CPImagesListInteractorOutput <NSObject>

/**
 Calls the method when -[SomeCPImagesListInteractor fetchImages] ended succesful.
 
 @param images The list of the images.
 */
- (void)didFetchImagesSuccessful:(NSArray<id<CPImageExternal>> *)images;
/**
 Calls the method when -[SomeCPImagesListInteractor fetchImages] ended with an error.
 
 @param error The error description. May be +[NSError cancelledError].
 */
- (void)didFetchImagesFail:(NSError *)error;

@end
