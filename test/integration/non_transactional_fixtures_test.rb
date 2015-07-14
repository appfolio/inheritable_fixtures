require 'integration_helper'

class NonTransactionalFixturesTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = false
  fixtures :all
  
  teardown :dirty_database

  def test_fixtures_in_normal_fixture_path
    assert_equal 2, City.all.size
    assert_equal "OneCity", cities(:one).name
    assert_equal "TwoCity", cities(:two).name
  end

  def test_fixtures_in_inherited_fixture_path
    assert_equal 2, State.all.size
    assert_equal "OneState", states(:one).name
    assert_equal "TwoState", states(:two).name
  end

  def test_fixtures_can_be_overriden
    assert_equal 1, Country.all.size
    assert_equal "SixCountry", countries(:six).name
  end

  private
  
  def dirty_database
    # write to the database to ensure these objects do not leak into 
    # the next test
    City.create!(:name => 'Dirty')
    State.create!(:name => 'Dirty')
    Country.create!(:name => 'Dirty')
  end

end