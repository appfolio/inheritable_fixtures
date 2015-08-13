Gem::Specification.new do |spec|
  spec.name          = "test_engine4"
  spec.version       = '0.0.1'
  spec.authors       = ["Paul Kmiec"]
  spec.email         = ["paul.kmiec@appfolio.com"]
  spec.summary       = 'engine to help test the inheritable_fixtures model generator'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.0"
  spec.add_dependency 'inheritable_fixtures'
end
