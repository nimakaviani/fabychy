lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubychy/version'

Gem::Specification.new do |spec|
  spec.name          = "rubychy"
  spec.version       = Fabychy::VERSION
  spec.authors       = ["Nima Kaviani"]
  spec.email         = ["nima@robochy.com"]
  spec.description   = %q{Ruby client for Facebook Bot API}
  spec.summary       = %q{Ruby client for Facebook Bot API}
  spec.homepage      = "https://github.com/nkaviani/rubychy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
 
  spec.add_dependency "httpclient", "~> 2.6"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "multi_json", "~> 1.11"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.1"
end
