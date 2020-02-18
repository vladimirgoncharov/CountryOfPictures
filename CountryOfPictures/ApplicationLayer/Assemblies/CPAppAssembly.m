#import "CPAppAssembly.h"
#import <RamblerAppDelegateProxy/RamblerAppDelegateProxy.h>
#import "CPAppDelegate.h"
#import "CPThirdPartiesConfigurator.h"
#import "CPAppRouter.h"

@implementation CPAppAssembly

- (RamblerAppDelegateProxy *)applicationDelegateProxy {
    return [TyphoonDefinition withClass:[RamblerAppDelegateProxy class]
                          configuration:^(TyphoonDefinition *definition){
        [definition injectMethod:@selector(addAppDelegates:)
                      parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@[
                [self appDelegate]
            ]];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (CPAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[CPAppDelegate class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(thirdPartiesConfigurator)
                              with:[self thirdPartiesConfigurator]];
        [definition injectProperty:@selector(appRouter)
                              with:[self appRouter]];

        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id<CPThirdPartiesConfiguratorProtocol>)thirdPartiesConfigurator {
    return [TyphoonDefinition withClass:[CPThirdPartiesConfigurator class]];
}

- (id<CPAppRouterProtocol>)appRouter {
    return [TyphoonDefinition withClass:[CPAppRouter class]
                          configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self window]];
    }];
}

- (UIWindow *)window {
    return [TyphoonDefinition withClass:[UIWindow class]
                          configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopePrototype;
        [definition useInitializer:@selector(initWithFrame:)
                        parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
    }];
}

@end
