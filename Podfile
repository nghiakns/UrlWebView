# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Gamma Tech' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Gamma Tech
  pod 'Alamofire'
  pod 'DropDown', '2.3.13'
  pod 'IQKeyboardManagerSwift'
  pod 'SwiftyJSON'
  pod 'ObjectMapper'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
  
end
