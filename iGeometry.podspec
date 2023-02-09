Pod::Spec.new do |spec|

  spec.name                       = 'iGeometry'
  spec.version                    = '1.11.1'
  spec.summary                    = 'Vectors operations in integer field'
  spec.authors                    = 'Nail Sharipov'
  spec.source                     = { :git => 'https://github.com/NailxSharipov/iGeometry.git', :tag => spec.version.to_s }
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage                   = 'https://github.com/NailxSharipov/iGeometry'


  spec.swift_versions             = ['5.0', '5.3']
  spec.requires_arc               = true

  spec.ios.deployment_target      = '11.0'
  spec.tvos.deployment_target     = '11.0'
  spec.macos.deployment_target    = '10.15'

  spec.source_files               = 'Sources/**/*.{h,m,swift}'

end