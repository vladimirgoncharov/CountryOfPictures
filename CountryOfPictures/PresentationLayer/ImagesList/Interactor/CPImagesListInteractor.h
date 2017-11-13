#import "CPImagesListInteractorInput.h"

@protocol CPImagesListInteractorOutput, CPImagesRepositoryProtocol;

/**
 The Interactor of ImagesList module.
 */
@interface CPImagesListInteractor : NSObject <CPImagesListInteractorInput>

@property (nonatomic, weak) id<CPImagesListInteractorOutput> output;
@property (nonatomic, strong) id<CPImagesRepositoryProtocol> imagesRepository;

@end
