Pod::Spec.new do |spec|

  spec.name                       = 'iGeometry'
  spec.version                    = '1.0'
  spec.summary                    = 'Vectors operations in integer field'
  spec.authors                    = 'Nail Sharipov'
  spec.source                     = { :git => 'git@github.com:NailxSharipov/iGeometry.git', :tag => spec.version.to_s }
  spec.license                    = 'MIT'
  spec.homepage                   = 'https://github.com/NailxSharipov/iGeometry'

  
  

  spec.swift_versions             = ['4.2', '5.0']
  spec.requires_arc               = true

  spec.ios.deployment_target      = '9.0'
  spec.tvos.deployment_target     = '9.0'
  spec.osx.deployment_target      = '10.9'
  spec.watchos.deployment_target  = '2.0'

  spec.source_files               = 'iGeometry/**/*.swift'

end