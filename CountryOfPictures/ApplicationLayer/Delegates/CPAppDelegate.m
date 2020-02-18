#import "CPAppDelegate.h"

#import <RamblerTyphoonUtils/AssemblyCollector.h>

#import "CPThirdPartiesConfiguratorProtocol.h"
#import "CPAppRouterProtocol.h"

@implementation CPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.appRouter startScreenWithData:launchOptions];
    [self.thirdPartiesConfigurator setupUI];
    return YES;
}

- (UIWindow *)window {
    return self.appRouter.window;
}

@end
