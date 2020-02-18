#import "CPImageExternal.h"

/**
 An model of the CPImage generates an url of an image.
 */
@interface CPImage : NSObject <CPImageExternal>

/**
 Initializes an instance of the CPImage with random width and heigth in the range from 100 to 300 pixels.
 
 @return New instance of the CPImage.
 */
- (instancetype _Nonnull)init;
/**
 Initializes an instance of the CPImage.
 
 @param width An image width size.
 @param height An image height size.
 @return New instance of the CPImage.
 */
- (instancetype _Nonnull)initWithWidth:(NSUInteger)width
                                height:(NSUInteger)height;

@end
