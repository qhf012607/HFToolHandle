
Pod::Spec.new do |s|
s.name         = "HFToolHandle"
s.version      = "0.0.1"
s.summary      = "use to do something"
s.homepage     = "https://github.com/qhf012607/Example"
s.license      = "MIT"

s.author             = { "qhf012607" => "963983088@qq.com" }
s.platform     = :ios, "7.0"

s.source       = { :git => "https://github.com/qhf012607/Example.git", :tag => "0.0.1" }


s.source_files  = "HFToolHandle", "HFToolHandle/**/*.{h,m}"
s.framework  = "UIKit"
end

