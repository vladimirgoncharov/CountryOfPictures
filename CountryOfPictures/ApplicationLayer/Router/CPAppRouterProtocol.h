#import <Foundation/Foundation.h>

/**
This protocol routes the app.
*/
@protocol CPAppRouterProtocol <NSObject>

/**
The main window.
*/
@property (nonatomic, strong, readonly) UIWindow *window;

/**
Show new start screen
*/
- (void)startScreenWithData:(id)data;

@end
