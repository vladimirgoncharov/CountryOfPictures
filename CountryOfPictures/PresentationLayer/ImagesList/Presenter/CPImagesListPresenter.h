#import "CPImagesListViewOutput.h"
#import "CPImagesListInteractorOutput.h"
#import "CPImagesListModuleInput.h"

@protocol CPImagesListViewInput;
@protocol CPImagesListInteractorInput;
@protocol CPImagesListRouterInput;

/**
 The Presenter of ImagesList module.
 */
@interface CPImagesListPresenter : NSObject <CPImagesListModuleInput, CPImagesListViewOutput, CPImagesListInteractorOutput>

@property (nonatomic, weak) id<CPImagesListViewInput> view;
@property (nonatomic, strong) id<CPImagesListInteractorInput> interactor;
@property (nonatomic, strong) id<CPImagesListRouterInput> router;

@end
