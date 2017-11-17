
Pod::Spec.new do |s|
s.name         = "HFToolHandle"
s.version      = "0.2.3"
s.summary      = "use to do something"
s.homepage     = "https://github.com/qhf012607/HFToolHandle"
s.license      = "MIT"

s.author             = { "qhf012607" => "963983088@qq.com" }
s.platform     = :ios, "7.0"

s.source       = { :git => "https://github.com/qhf012607/HFToolHandle.git", :tag => "0.2.3" }

s.source_files  = 'HFToolHandle/HFToolHandle/HFTableTool/imp/*','HFToolHandle/HFTableTool/View/**/*'
s.framework  = "UIKit"

end

