# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bankocr/version'

Gem::Specification.new do |spec|
  spec.name          = 'bankocr'
  spec.version       = BankOCR::VERSION
  spec.authors       = ['Javier Cervantes']
  spec.email         = ['javier@hybridgroup.com']
  spec.summary       = %w(Solution to BankOCR Kata)
  spec.description   = %w(Solution to BankOCR Kata)
  spec.homepage      = 'https://github.com/solojavier/bankOCR'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
