#import "CPTestsAppDelegate.h"
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@implementation CPTestsAppDelegate

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    return [collector collectInitialAssemblyClasses];
}

- (UIWindow *)window {
    return nil;
}

@end
