#import <UIKit/UIKit.h>

#import "CPImagesListViewInput.h"

@protocol CPImagesListViewOutput;

/**
 The View of ImagesList module.
 */
@interface CPImagesListViewController : UIViewController <CPImagesListViewInput>

@property (nonatomic, strong, readonly) NSArray<CPImage *>* images;
@property (nonatomic, strong) id<CPImagesListViewOutput> output;

@end
