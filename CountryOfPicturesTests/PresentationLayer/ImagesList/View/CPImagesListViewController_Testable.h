#import "CPImagesListViewController.h"

/**
 Extension makes private factory methods open for testing.
 */
@interface CPImagesListViewController()

@property (nonatomic, weak, nullable) UICollectionView *collectionView;
@property (nonatomic, weak, nullable) UIRefreshControl *pullToRefreshView;

- (IBAction)refresh:(UIRefreshControl *)sender;

@end
