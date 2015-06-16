# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "apns-s3"
  spec.version       = ApnsS3::VERSION
  spec.authors       = ["ka"]
  spec.email         = ["ka.kaosf@gmail.com"]
  spec.summary       = %q{APNs with pemfile on AWS S3}
  spec.description   = %q{APNs with pemfile on AWS S3}
  spec.homepage      = "https://github.com/kaosf/apns-s3"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", "~> 2.1.0"
  spec.add_dependency "apns", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.1.2"
  spec.add_development_dependency "coveralls", "~> 0.8.1"
end
