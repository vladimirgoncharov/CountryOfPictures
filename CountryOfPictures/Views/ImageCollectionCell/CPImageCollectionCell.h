#import <UIKit/UIKit.h>

/**
 The class contains the UIImageView for displaying an image.
 */
@interface CPImageCollectionCell: UICollectionViewCell

/**
 Starts downloading a new image. The old download is interrupted.

 @param url The image url.
 */
- (void)loadImageByURL:(NSURL *)url;

/**
 Cancels the current image download. If the download is not started or already completed there is nothing doing.
 */
- (void)cancelImageLoad;

@end
