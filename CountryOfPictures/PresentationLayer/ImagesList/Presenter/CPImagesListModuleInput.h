#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

/**
 Basic requirements for setup ImagesList module.
 */
@protocol CPImagesListModuleInput <RamblerViperModuleInput>

/**
 The starting configuration of the module is not tied to the state view.
 */
- (void)configureModule;

@end
