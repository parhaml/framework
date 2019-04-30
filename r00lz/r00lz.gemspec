
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r00lz/version'

Gem::Specification.new do |spec|
  spec.name          = 'r00lz'
  spec.version       = '0.1'
  spec.authors       = 'parhaml'
  spec.email         = 'lee.p.parham@gmail.com'
  spec.summary       = ''

  spec.license       = 'MIT'

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'pry'
  spec.add_runtime_dependency 'rack', '~> 2.0.7'
end
