#import <Foundation/Foundation.h>

/**
 The main image interface.
 */
@protocol CPImageExternal <NSObject>

/**
 The width of an image.
 */
@property (nonatomic, assign, readonly) NSInteger width;

/**
 The height of an image.
 */
@property (nonatomic, assign, readonly) NSInteger height;

/**
 The url is generated automatically after initialization.
 */
@property (nonatomic, strong, nonnull, readonly) NSURL *url;

@end
