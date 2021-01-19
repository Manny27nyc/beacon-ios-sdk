Pod::Spec.new do |spec|
  spec.name         = 'beacon'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/anonymoussprocket/beacon-ios-sdk'
  spec.authors      = { 'Mike' => 'mike@cryptonomic.tech' }
  spec.summary      = 'Beacon support fo iOS'
  spec.source       = { :git => 'https://github.com/anonymoussprocket/beacon-ios-sdk', :tag => '1.0.0' }
  spec.source_files = 'Sources/BeaconSDK/**/*'

  spec.swift_version = "5.0"
  spec.ios.deployment_target = "13.0"


  spec.dependency "Base58Swift"
  spec.dependency "libsodium"

end
