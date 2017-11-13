#import <UIKit/UIKit.h>
#import <CHTCollectionViewWaterfallLayout/CHTCollectionViewWaterfallLayout.h>

@class CPImage;

/**
 Basic requirements for View of ImagesList module.
 */
@protocol CPImagesListViewInput <NSObject, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

/**
 The view is loaded and we should setup it here.
 */
- (void)setupInitialState;

/**
 The list of displayed images.

 @return The images list.
 */
- (NSArray<CPImage *>*)images;
/**
 Replace and reload the current list of the images.

 @param images The images list.
 */
- (void)reloadImages:(NSArray<CPImage *>*)images;

/**
 Displaying the progress view that notifies you when data is loading.
 */
- (void)showProgressView;
/**
 Hides the progress view that notifies you when data is loaded.
 */
- (void)dismissProgressView;

/**
 Displays a view with a description of the error.
 If the error is cancelled operation then the error will not be displayed.

 @param error The error of any action. Displays the alert message like - [NSError localizedDescription].
 */
- (void)showError:(NSError *)error;

/**
 Tells the pull to refresh view that a refresh operation has ended.
 */
- (void)dismissPullToRefreshView;

@end
