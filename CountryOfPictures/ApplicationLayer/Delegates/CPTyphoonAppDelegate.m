#import "CPTyphoonAppDelegate.h"
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@implementation CPTyphoonAppDelegate

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    return [collector collectInitialAssemblyClasses];
}

@end
