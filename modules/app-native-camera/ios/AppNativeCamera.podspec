Pod::Spec.new do |s|
  s.name           = 'AppNativeCamera'
  s.version        = '1.0.0'
  s.summary        = 'Native Camera rendered via Expo Module'
  s.description    = 'Native Camera rendered via Expo Module'
  s.author         = 'Bharat Tiwari'
  s.homepage       = 'https://docs.expo.dev/modules/'
  s.platforms      = {
    :ios => '15.1',
    :tvos => '15.1'
  }
  s.source         = { git: '' }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'
  s.frameworks = 'AVFoundation', 'CoreMedia', 'CoreVideo', 'QuartzCore'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,mm,swift,hpp,cpp}"
end
