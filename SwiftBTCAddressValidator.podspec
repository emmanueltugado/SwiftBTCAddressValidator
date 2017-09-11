Pod::Spec.new do |s|
  s.name             = 'SwiftBTCAddressValidator'
  s.version          = '0.1.3'
  s.summary          = 'Bitcoin address validator written in Swift'
 
  s.description      = <<-DESC
Validate Bitcoin addresses in one line! Written purely in Swift!
                       DESC
 
  s.homepage         = 'https://github.com/emmanueltugado/SwiftBTCAddressValidator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Emmanuel Tugado' => 'emmanueltugado@gmail.com' }
  s.source           = { :git => 'https://github.com/emmanueltugado/SwiftBTCAddressValidator.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.3'
  s.source_files = 'SwiftBTCAddressValidator/BTCAddressValidator.swift'
  
  s.dependency 'CryptoSwift', '~> 0.6.9'
 
end
