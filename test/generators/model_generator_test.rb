require 'generators/generator_test_helper'
require 'rails/generators/test_unit/model/model_generator'

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests TestUnit::Generators::ModelGenerator

  def test_fixtures_path__app_context
    run_generator %w(Account name:string age:integer)

    assert_file 'test/fixtures/accounts.yml'
    assert_no_file 'lib/fixtures/accounts.yml'
  end

  def test_fixtures_path__engine_context
    # To test the model generator override in an engine context we need
    # to run the generator from the command line.

    in_test_engine_dir do
      quietly do
        system('rails g model Account name:string age:integer')
      end

      assert File.exist?('lib/fixtures/accounts.yml')
      assert !File.exist?('test/fixtures/accounts.yml')
    end
  ensure
    in_test_engine_dir do
      quietly do
        system('rails destroy model Account')
      end
    end
  end

  private

  def quietly
    capture(:stdout) do
      yield
    end
  end

  def in_test_engine_dir
    FileUtils.cd('test/test_app/engines/test_engine4') do
      yield
    end
  end

end
