case RUBY_VERSION
when '3.0.7', '3.1.5', '3.2.4', '3.3.1'
  appraise 'rails6' do
    gem 'rails', '~> 6.0'
  end
  appraise 'rails7_0' do
    gem 'rails', '~> 7.0.0'
  end
  appraise 'rails7_1' do
    gem 'rails', '~> 7.1.0'
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end
