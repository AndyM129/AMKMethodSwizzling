#
#  Be sure to run `pod spec lint AMKMethodSwizzling.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "AMKMethodSwizzling"
  s.version      = "1.0.0"
  s.summary      = "使用黑魔法来修改原生类的方法"
  s.description  = <<-DESC
                   通过运行时，使用黑魔法来修改原生类的方法
                   DESC
  s.homepage     = "https://github.com/AndyM129/AMKMethodSwizzling"
  s.license      = "MIT"
  s.author       = { "Andy Meng" => "andy_m129@163.com" }
  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/AndyM129/AMKMethodSwizzling.git", :tag => s.version.to_s }
  s.source_files  = "AMKMethodSwizzlingDemo/AMKMethodSwizzling/*.{h,m}"
  s.requires_arc = true
  s.frameworks = 'Foundation', 'UIKit' 

end
