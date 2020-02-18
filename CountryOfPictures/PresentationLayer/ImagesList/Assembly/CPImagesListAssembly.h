#import <Typhoon/Typhoon.h>

#import <RamblerTyphoonUtils/AssemblyCollector.h>

#import "CPBusinessAssembly.h"

/**
 Makes assembly of components for ImagesList module.
 */
@interface CPImagesListAssembly : TyphoonAssembly <RamblerInitialAssembly>

/**
The assembly containts business layer services.
*/
@property (readonly) CPBusinessAssembly *businessAssembly;

@end
