# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ucrdtw/version'

Gem::Specification.new do |spec|
  spec.name          = "ucrdtw"
  spec.version       = Ucrdtw::VERSION
  spec.authors       = ["Chris Beer"]
  spec.email         = ["chris@cbeer.info"]

  spec.summary       = %q{UCR DTW FFI wrapper}
  spec.homepage      = "https://github.com/cbeer/ucrdtw"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions << 'ext/Rakefile'
  spec.add_dependency 'ffi-compiler'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
