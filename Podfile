source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def common_pods
    # Dependency injection libraries.
    pod 'Typhoon', '~> 4.0.3'

    # Helpers
    pod 'ViperMcFlurry', :git => 'https://github.com/rambler-digital-solutions/ViperMcFlurry.git', :tag => '1.5.2'
    pod 'RamblerTyphoonUtils/AssemblyCollector', '~> 1.5.0'
    pod 'PureLayout', '~> 3.0.2'
    pod 'PromiseKit', '~> 4.4'
    pod 'SDWebImage', '~> 4.0'

    # UI
    pod 'SVProgressHUD', '~> 2.2.2'
    pod 'CHTCollectionViewWaterfallLayout', '~> 0.9.7'
end

target 'CountryOfPictures' do
    common_pods
end

target 'CountryOfPicturesTests' do
    common_pods

    # Mocking
    pod 'OCMock', '~> 3.4.1'
end

target 'CountryOfPicturesUITests' do
    common_pods
end

# Setup settings for each pod.
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Resolve the error https://stackoverflow.com/questions/38446097/xcode-8-beta-3-use-legacy-swift-issue/38466703#38466703.
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
