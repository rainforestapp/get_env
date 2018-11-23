lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_env/version'

Gem::Specification.new do |spec|
  spec.name          = 'get_env'
  spec.version       = GetEnv::VERSION
  spec.authors       = ['Simon Mathieu', 'Bartek Kruszczynski', 'Jonathan Barber']
  spec.email         = ['bartek@rainforestqa.com', 'jonathan@rainforestqa.com']

  spec.summary       = 'Read values from ENV in a reasonable way'
  spec.description   = 'Read values from ENV in a reasonable way'
  spec.homepage      = 'https://github.com/rainforestapp/get_env'
  spec.license       = 'MIT'

  spec.files         = ['lib/get_env.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
end
