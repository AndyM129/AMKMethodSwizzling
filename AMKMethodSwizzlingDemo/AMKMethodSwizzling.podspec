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
  s.license      = "MITnse"
  s.author       = { "Andy Meng" => "andy_m129@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AndyM129/AMKMethodSwizzling.git", :tag => "1.0.0" }
  s.source_files = "AMKMethodSwizzling/*"
  s.requires_arc = true

end
