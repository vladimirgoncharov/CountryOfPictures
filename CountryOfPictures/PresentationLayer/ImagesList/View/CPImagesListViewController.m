#import "CPImagesListViewController.h"

#import "CPImagesListViewOutput.h"
#import "CPImageCollectionCell.h"
#import "CPImage.h"

#import <SVProgressHUD/SVProgressHUD.h>
#import <PureLayout/PureLayout.h>
#import <PromiseKit/PromiseKit.h>

static NSString *ImageCellId = @"CPImageCollectionCell";

@interface CPImagesListViewController()

@property (nonatomic, weak, nullable) UICollectionView *collectionView;
@property (nonatomic, weak, nullable) UIRefreshControl *pullToRefreshView;
@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation CPImagesListViewController

#pragma mark - Life cycle

- (void)loadView {
    [super loadView];

    UICollectionView *collectionView = [self createCollectionView];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;

    UIRefreshControl *pullToRefreshView = [self createPullToRefreshView];
    [collectionView addSubview:pullToRefreshView];
    self.pullToRefreshView = pullToRefreshView;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Layout constraints

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        [self.collectionView autoPinEdgesToSuperviewEdges];
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - Helpers

- (UICollectionViewLayout *)createCollectionViewLayout {
    CHTCollectionViewWaterfallLayout *layout = [CHTCollectionViewWaterfallLayout new];
    layout.columnCount = 3;
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumColumnSpacing = 1.0;
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
    return layout;
}

- (UICollectionView *)createCollectionView {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                          collectionViewLayout:[self createCollectionViewLayout]];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    return collectionView;
}

- (UIRefreshControl *)createPullToRefreshView {
    UIRefreshControl *pullToRefresh = [UIRefreshControl new];
    pullToRefresh.backgroundColor = [UIColor clearColor];
    [pullToRefresh addTarget:self
                      action:@selector(refresh:)
            forControlEvents:UIControlEventValueChanged];
    return pullToRefresh;
}

#pragma mark - Actions

- (IBAction)refresh:(UIRefreshControl *)sender {
    [self.output pullDownToRefresh];
}

#pragma mark - CPImagesListViewInput

- (void)setupInitialState {
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.collectionView registerClass:[CPImageCollectionCell class]
            forCellWithReuseIdentifier:ImageCellId];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.navigationItem.title = @"Images";
}

- (void)reloadImages:(NSArray<CPImage *> *)images {
    _images = images;
    [self.collectionView reloadData];
}

- (void)showProgressView {
    [SVProgressHUD showWithStatus:@"Downloading..."];
}

- (void)dismissProgressView {
    [SVProgressHUD dismiss];
}

- (void)showError:(NSError *)error {
    if (!error.isCancelled) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:[error localizedDescription]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleCancel
                                                handler:nil]];
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    }
}

- (void)dismissPullToRefreshView {
    if ([self.pullToRefreshView isRefreshing]) {
        [self.pullToRefreshView endRefreshing];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CPImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCellId
                                                                            forIndexPath:indexPath];
    [self updateCell:cell
         atIndexPath:indexPath];
    return cell;
}

- (void)updateCell:(CPImageCollectionCell *)cell
       atIndexPath:(NSIndexPath *)indexPath {
    CPImage *image = [self.images objectAtIndex:indexPath.row];
    [cell loadImageByURL:[image url]];
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CPImage *image = [self.images objectAtIndex:indexPath.row];
    return CGSizeMake(image.width,
                      image.height);
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    CPImageCollectionCell *imageCell = (CPImageCollectionCell *)cell;
    [imageCell cancelImageLoad];
}

@end
