source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def common_pods
    # VIPER
    pod 'RamblerAppDelegateProxy', '= 0.0.5'
    pod 'ViperMcFlurry', :git => 'https://github.com/rambler-digital-solutions/ViperMcFlurry.git', :tag => '1.5.2'
    pod 'RamblerTyphoonUtils/AssemblyCollector', '= 1.5.0'

    # Dependency injection libraries.
    pod 'Typhoon', '= 4.0.8'

    # UI
    pod 'SVProgressHUD', '= 2.2.2'
    pod 'CHTCollectionViewWaterfallLayout', '= 0.9.7'

    # Helpers
    pod 'Masonry', '= 1.1.0'
    pod 'Bolts', '= 1.9.0'
    pod 'SDWebImage', '= 5.5.2'
end

target 'CountryOfPictures' do
    common_pods
end

target 'CountryOfPicturesTests' do
    common_pods

    # Mocking
    pod 'OCMock', '= 3.5'
end

target 'CountryOfPicturesUITests' do
    common_pods
end
