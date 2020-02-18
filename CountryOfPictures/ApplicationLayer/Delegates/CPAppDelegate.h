#import <UIKit/UIKit.h>

@protocol CPThirdPartiesConfiguratorProtocol;
@protocol CPAppRouterProtocol;

/**
 A set of methods that are called by the singleton UIApplication object in response to important events in the lifetime of your app.
 */
@interface CPAppDelegate : NSObject <UIApplicationDelegate>

/**
The service set up libraries.
*/
@property (strong, nonatomic) id<CPThirdPartiesConfiguratorProtocol> thirdPartiesConfigurator;
/**
The service routes the app.
*/
@property (strong, nonatomic) id<CPAppRouterProtocol> appRouter;

@end

