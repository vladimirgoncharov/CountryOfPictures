#import <Foundation/Foundation.h>

/**
 An model of the CPImage generates an url of an image.
 */
@interface CPImage : NSObject

/**
 The width of an image.
 */
@property (nonatomic, assign, readonly) NSInteger width;

/**
 The height of an image.
 */
@property (nonatomic, assign, readonly) NSInteger height;

/**
 The location of an image. The url is generated automatically after initialization.
 */
@property (nonatomic, strong, nonnull, readonly) NSURL *url;

/**
 Initializes an instance of the CPImage with random width and heigth in the range from 100 to 300 pixels.

 @return New instance of the CPImage.
 */
- (instancetype _Nonnull )init;
/**
 Initializes an instance of the CPImage.

 @param width An image width size.
 @param height An image height size.
 @return New instance of the CPImage.
 */
- (instancetype _Nonnull )initWithWidth:(NSUInteger)width
                                 height:(NSUInteger)height;

@end
