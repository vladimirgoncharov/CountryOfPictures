#import "AssemblyTesting.h"
#import <Typhoon/Typhoon.h>

#import "CPBusinessAssembly.h"
#import "CPBusinessAssembly_Testable.h"

#import "CPImagesRepository.h"

@interface CPBusinessAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) CPBusinessAssembly *assembly;

@end

@implementation CPBusinessAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [TyphoonBlockComponentFactory factoryWithAssembly:[CPBusinessAssembly assembly]];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesImagesRepository {
    // given
    Class targetClass = [CPImagesRepository class];
    NSArray *protocols = @[];
    NSArray *dependencies = @[];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly imagesRepository];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
