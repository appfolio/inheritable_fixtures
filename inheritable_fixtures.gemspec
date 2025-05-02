# frozen_string_literal: true

require_relative 'lib/inheritable_fixtures/version'

Gem::Specification.new do |spec|
  spec.name                  = 'inheritable_fixtures'
  spec.version               = InheritableFixtures::VERSION
  spec.platform              = Gem::Platform::RUBY
  spec.author                = 'AppFolio'
  spec.email                 = 'opensource@appfolio.com'
  spec.description           = 'Allows fixtures from Rails engines to be inherited by downstream engines and the enclosing Rails app.'
  spec.summary               = spec.description
  spec.homepage              = 'https://github.com/appfolio/inheritable_fixtures'
  spec.license               = 'MIT'
  spec.files                 = Dir['**/*'].select { |f| f[/^(lib\/|LICENSE.txt|.*gemspec)/] }
  spec.require_paths         = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('< 3.5')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_dependency('activerecord', ['>= 7', '< 7.2'])
  spec.add_dependency('rails', ['>= 7', '< 7.2'])
end
