#import "AssemblyTesting.h"
#import <Typhoon/Typhoon.h>

#import "CPImagesListAssembly.h"
#import "CPImagesListAssembly_Testable.h"
#import "CPBusinessAssembly.h"

#import "CPImagesListViewController.h"
#import "CPImagesListPresenter.h"
#import "CPImagesListInteractor.h"
#import "CPImagesListRouter.h"
#import "CPImagesRepositoryProtocol.h"

@interface CPImagesListAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) CPImagesListAssembly *assembly;

@end

@implementation CPImagesListAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [TyphoonBlockComponentFactory factoryWithAssemblies:@[[CPImagesListAssembly assembly], [CPBusinessAssembly assembly]]];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [CPImagesListViewController class];
    NSArray *protocols = @[
                           @protocol(CPImagesListViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewImagesList];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [CPImagesListPresenter class];
    NSArray *protocols = @[
                           @protocol(CPImagesListModuleInput),
                           @protocol(CPImagesListViewOutput),
                           @protocol(CPImagesListInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router),
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterImagesList];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [CPImagesListInteractor class];
    NSArray *protocols = @[
                           @protocol(CPImagesListInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
													      
    // when
    id result = [self.assembly interactorImagesList];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [CPImagesListRouter class];
    NSArray *protocols = @[
                           @protocol(CPImagesListRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerImagesList];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
