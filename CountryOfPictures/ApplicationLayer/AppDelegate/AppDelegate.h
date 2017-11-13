#import <UIKit/UIKit.h>

/**
 A set of methods that are called by the singleton UIApplication object in response to important events in the lifetime of your app.
 */
@interface AppDelegate : UIResponder <UIApplicationDelegate>

/**
 This property contains the window used to present the app’s visual content on the device’s main screen.
 */
@property (strong, nonatomic) UIWindow *window;

@end

