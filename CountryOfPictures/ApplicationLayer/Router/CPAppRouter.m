#import "CPAppRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>
#import <Typhoon/TyphoonComponentFactory.h>

@implementation CPAppRouter

- (void)startScreenWithData:(id)data {
    UIViewController *viewController = [[TyphoonComponentFactory factoryForResolvingUI] componentForKey:@"viewImagesList"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}

@end
