#import <UIKit/UIKit.h>
#import "CPAppRouterProtocol.h"
/**
This service routes the app.
*/
@interface CPAppRouter : NSObject <CPAppRouterProtocol>

@property (nonatomic, strong) UIWindow *window;

@end
