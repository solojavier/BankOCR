# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bankocr/version'

Gem::Specification.new do |spec|
  spec.name          = 'bankocr'
  spec.version       = BankOCR::VERSION
  spec.authors       = ['Javier Cervantes']
  spec.email         = ['1.27201@gmail.com']
  spec.summary       = %w(Solution to BankOCR Kata)
  spec.description   = %w(Solution in ruby of BankOCR Kata: http://code.joejag.com/coding-dojo-bank-ocr/)
  spec.homepage      = 'https://github.com/solojavier/bankOCR'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['bankocr']
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls', '~> 0.7'

  spec.add_runtime_dependency 'thor', '~> 0.19'
end
