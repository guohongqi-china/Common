#
# Be sure to run `pod lib lint commonTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'commonTools'
  s.version          = '0.1.0'
  s.summary          = 'A short description of commonTools.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/guohongqi-china/commonTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guohongqi-china' => '820003039@qq.com' }
  s.source           = { :git => 'https://github.com/guohongqi-china/commonTools.git', :tag => s.version.to_s }

  s.public_header_files = "commonTools/Classes/ProConfig.h"
  s.source_files  = "commonTools/Classes/**/*"
  s.ios.deployment_target = '8.0'

  s.requires_arc = true

#s.subspec 'FrameTools' do |ss|
  #ss.source_files = 'commonTools/Classes/FrameTools/**/*.{h,m}'
  #ss.public_header_files = 'commonTools/Classes/FrameTools/**/*.{h}'
#end


  # s.source_files = 'commonTools/Classes/**/*'
  
  # s.resource_bundles = {
  #   'commonTools' => ['commonTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
