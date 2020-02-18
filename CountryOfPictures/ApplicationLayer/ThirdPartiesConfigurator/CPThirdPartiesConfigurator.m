#import "CPThirdPartiesConfigurator.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation CPThirdPartiesConfigurator

- (void)setupUI {
    [self setupSVProgressHUD];
}

#pragma mark - Helpers

- (void)setupSVProgressHUD {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

@end
