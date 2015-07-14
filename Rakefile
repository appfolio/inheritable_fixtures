require 'rubygems'
require 'bundler/setup'

require 'rake/testtask'
require 'bundler/gem_tasks'

APP_RAKEFILE = File.expand_path("../test/test_app/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
end

task :default => :test
