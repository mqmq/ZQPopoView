Pod::Spec.new do |s|

  s.name         = "ZQPopoView"
  s.version      = "0.0.1"
  s.summary      = "popoView"

  s.description  = <<-DESC
       抽屉弹出popoView
                   DESC

  s.homepage     = "https://github.com/mqmq/ZQPopoView.git"
  s.license      = "MIT"
  s.author       = { "ZQQ" => "z541833048@163.com" }
  s.platform     = :ios,'9.0'

  s.source       = { :git => "https://github.com/mqmq/ZQPopoView.git", :tag => "#{s.version}" }
  s.source_files = "ZQPopoView.swift"
  s.framework    = "UIKit"
  s.requires_arc = true
end
