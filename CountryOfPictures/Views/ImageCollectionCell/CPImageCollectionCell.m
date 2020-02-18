#import "CPImageCollectionCell.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>

@interface CPImageCollectionCell()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation CPImageCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [self createImageView];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        [self setNeedsUpdateConstraints];
        [self layoutIfNeeded];
    }
    return self;
}

- (UIImageView *)createImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.backgroundColor = [UIColor grayColor];
    imageView.layer.cornerRadius = 10.0;
    return imageView;
}

#pragma mark - Layout constraints

- (void)updateConstraints {
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [super updateConstraints];
}

#pragma mark - Methods

- (void)loadImageByURL:(NSURL *)url {
    [self.imageView sd_setImageWithURL:url];
}

- (void)cancelImageLoad {
    [self.imageView sd_cancelCurrentImageLoad];
    self.imageView.image = nil;
}

#pragma mark - Reuse

- (void)prepareForReuse {
    [self.imageView setImage:nil];
    [super prepareForReuse];
}

@end
