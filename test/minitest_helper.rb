require 'rubygems'
require 'bundler/setup'

require 'minitest/autorun'

unless ::Minitest.const_defined?(:Test)
  ::Minitest::Test = ::Minitest::Unit::TestCase
end
