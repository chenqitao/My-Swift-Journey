# Be sure to run `pod lib lint AnimatedCardInput.podspec' to ensure this is a valid spec before submitting.

Pod::Spec.new do |s|
  s.name             = 'AnimatedCardInput'
  s.version          = '0.3.0'
  s.summary          = 'iOS library with components for input of Credit Card data'

  s.description      = "This library let's you drop into your project an animated component representing Credit Card and allow users to enter their data directly onto it."

  s.homepage         = 'https://github.com/netguru/AnimatedCardInput'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kamil Szczepański' => 'kamil.szczepanski@netguru.com' }
  s.source           = { :git => 'https://github.com/netguru/AnimatedCardInput.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.netguru.com/codestories/topic/ios'

  s.swift_versions = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'AnimatedCardInput/Classes/**/*'
  
   s.resource_bundles = {
     'AnimatedCardInput' => ['AnimatedCardInput/Assets/*.png']
   }
end
