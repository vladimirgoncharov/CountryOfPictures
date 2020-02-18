#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol CPImagesRepositoryProtocol;

/**
Makes assembly contains services.
*/
@interface CPBusinessAssembly : TyphoonAssembly <RamblerInitialAssembly>

/**
The service provide access to image data.
*/
- (id<CPImagesRepositoryProtocol>)imagesRepository;

@end
