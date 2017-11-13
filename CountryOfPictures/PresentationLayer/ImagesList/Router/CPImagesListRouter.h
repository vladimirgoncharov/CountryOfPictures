#import "CPImagesListRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

/**
 The Router of ImagesList module.
 */
@interface CPImagesListRouter : NSObject <CPImagesListRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
