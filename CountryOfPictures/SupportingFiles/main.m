#import <UIKit/UIKit.h>
#import <RamblerAppDelegateProxy/RamblerAppDelegateProxy.h>
#import "CPTyphoonAppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Class appDelegateClass;
        if (!NSClassFromString(@"XCTest")) {
            [[RamblerAppDelegateProxy injector] setDefaultAppDelegate:[CPTyphoonAppDelegate new]];
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([RamblerAppDelegateProxy class]));
        } else {
            appDelegateClass = NSClassFromString(@"CPTestsAppDelegate");
        }
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
    }
}
