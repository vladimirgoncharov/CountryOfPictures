#import <Foundation/Foundation.h>

/**
 Basic requirements for Presenter's View of ImagesList module.
 */
@protocol CPImagesListViewOutput <NSObject>

/**
 Tells the Presenter that the View is loaded.
 */
- (void)didTriggerViewReadyEvent;

/**
 Tells the Presenter that an user perfromed pull down to refresh action.
 */
- (void)pullDownToRefresh;

@end
