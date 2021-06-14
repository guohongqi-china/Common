#
# Be sure to run `pod lib lint commonTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'commonTools'
  s.version          = '0.1.20'
  s.summary          = 'common user'

  s.description      = <<-DESC
  common tools for user
                       DESC

  s.homepage         = 'https://github.com/guohongqi-china/Common'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guohongqi-china' => '820003039@qq.com' }
  s.source           = { :git => 'https://github.com/guohongqi-china/Common.git', :tag => "v#{s.version}" }

  s.source_files  = "commonTools/Classes/**/*"
  s.ios.deployment_target = '10.0'

  s.requires_arc = true



end
