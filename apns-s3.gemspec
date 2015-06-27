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

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", "~> 2.1.0"
  spec.add_dependency "apns", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.1.2"
  spec.add_development_dependency "coveralls", "~> 0.8.1"
end
