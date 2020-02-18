#import "CPImage.h"

@implementation CPImage

@synthesize width = _width, height = _height, url = _url;

#pragma mark - init

- (instancetype)init {
    NSInteger randomWidth = 100 + arc4random_uniform(200);
    NSInteger randomHeight = 100 + arc4random_uniform(200);
    return [self initWithWidth:randomWidth
                        height:randomHeight];
}

- (instancetype)initWithWidth:(NSUInteger)width
                       height:(NSUInteger)height {
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
        _url = [NSURL URLWithString:[NSString stringWithFormat:@"https://picsum.photos/%li/%li/",
                                     (long)width,
                                     (long)height]];
    }
    return self;
}

@end
