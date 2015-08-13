require 'test_helper'
require 'open3'

class FixtureFileUploadTest < ActionController::TestCase
  
  def test_fixtures_in_normal_fixture_path
    expected = File.read(File.expand_path('../../fixtures/cities.yml', __FILE__))
    assert_equal expected, File.read(fixture_file_upload('cities.yml').local_path)
  end

  def test_fixtures_in_inherited_fixture_path
    expected = File.read(File.expand_path('../../fixtures2/states.yml', __FILE__))
    assert_equal expected, File.read(fixture_file_upload('states.yml').local_path)
  end

  def test_fixtures_can_be_overriden
    expected = File.read(File.expand_path('../../fixtures/countries.yml', __FILE__))
    assert_equal expected, File.read(fixture_file_upload('countries.yml').local_path)
  end
  
  def test_file_does_not_exist
    assert_raises(RuntimeError) do
      fixture_file_upload('foobar.yml')
    end
  end
  
end