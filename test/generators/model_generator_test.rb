require 'generators/generator_test_helper'
require 'generators/test_unit/model/model_generator'

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests TestUnit::Generators::ModelGenerator

  def test_fixtures_path__app_context
    capture(:stdout) do
      run_generator %w(Account name:string age:integer)
    end

    assert_file 'test/fixtures/accounts.yml'
    assert_no_file 'lib/fixtures/accounts.yml'
  end

  def test_fixtures_path__engine_context
    # capture(:stdout) do
    #   run_generator %w(Account name:string age:integer)
    # end
    #
    # assert_file 'lib/fixtures/accounts.yml'
    # assert_no_file 'test/fixtures/accounts.yml'
  end

end