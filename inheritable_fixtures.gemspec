# coding: utf-8
require_relative 'lib/inheritable_fixtures/version'

Gem::Specification.new do |spec|
  spec.name = 'inheritable_fixtures'
  spec.version = InheritableFixtures::VERSION
  spec.authors = ['AppFolio, Inc.']
  spec.email = ['dev@appfolio.com']

  spec.required_ruby_version = '>= 2.0.0'

  spec.summary = %q{Inherit Rails fixtures}
  spec.description = %q{Allows fixtures from Rails engines to be inherited by downstream engines and the enclosing Rails app}
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/})}
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f)}
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', ['>= 6.0', '< 7.2']
end
