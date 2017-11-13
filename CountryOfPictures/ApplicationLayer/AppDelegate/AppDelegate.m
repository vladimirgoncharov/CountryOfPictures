#import "AppDelegate.h"

#import <RamblerTyphoonUtils/AssemblyCollector.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupSVProgressHUD];
    return YES;
}

- (void)setupSVProgressHUD {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

#pragma mark - DI

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    return [collector collectInitialAssemblyClasses];
}

@end
