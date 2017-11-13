#import "CPImage.h"

@implementation CPImage

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
        _url = [NSURL URLWithString:[NSString stringWithFormat:@"http://lorempixel.com/%li/%li/",
                                     (long)width,
                                     (long)height]];
    }
    return self;
}

@end
