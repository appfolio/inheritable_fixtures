require 'test_helper'
require 'open3'

class DbFixtureLoadTest < ActiveSupport::TestCase
  self.use_transactional_tests = false

  setup :clear_database

  def test_db_fixtures_load
    assert_equal 0, City.all.size
    assert_equal 0, State.all.size
    assert_equal 0, Country.all.size

    rake_db_fixtures_load

    ActiveRecord::Base.uncached do
      assert_equal 2, City.all.size
      assert_equal 2, State.all.size
      assert_equal 1, Country.all.size
    end
  end

  def test_db_fixtures_load__with_fixture_path
    assert_equal 0, City.all.size
    assert_equal 0, State.all.size
    assert_equal 0, Country.all.size

    rake_db_fixtures_load('FIXTURES_PATH=../../test/fixtures3')

    ActiveRecord::Base.uncached do
      assert_equal 0, City.all.size
      assert_equal 0, State.all.size
      assert_equal 2, Country.all.size
    end
  end

  def test_db_fixtures_load__with_fixtures
    assert_equal 0, City.all.size
    assert_equal 0, State.all.size
    assert_equal 0, Country.all.size

    rake_db_fixtures_load('FIXTURES=countries,states')

    ActiveRecord::Base.uncached do
      assert_equal 0, City.all.size
      assert_equal 2, State.all.size
      assert_equal 1, Country.all.size
    end
  end

  def test_db_fixtures_load__with_fixtures_not_found
    assert_equal 0, City.all.size
    assert_equal 0, State.all.size
    assert_equal 0, Country.all.size

    _, stderr, _ = rake_db_fixtures_load('FIXTURES=foobar')
    assert stderr.include?('Fixtures ["foobar"] not found')

    ActiveRecord::Base.uncached do
      assert_equal 0, City.all.size
      assert_equal 0, State.all.size
      assert_equal 0, Country.all.size
    end
  end

  private

  def rake_db_fixtures_load(args = nil)
    cmd = []
    cmd << "cd #{InheritableFixtures::Engine.root}/test/test_app"
    cmd << "&&"
    cmd << "rake db:fixtures:load RAILS_ENV=test"
    cmd << args

    Open3.capture3(cmd.compact.join(' '))
  end

  def clear_database
    City.destroy_all
    State.destroy_all
    Country.destroy_all
  end
end
