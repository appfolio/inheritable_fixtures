# InheritableFixtures

[![GitHub version](https://badge.fury.io/gh/appfolio%2Finheritable_fixtures.svg)](http://badge.fury.io/gh/appfolio%2Finheritable_fixtures)
[![Build Status](https://travis-ci.org/appfolio/inheritable_fixtures.svg?branch=master)](https://travis-ci.org/appfolio/inheritable_fixtures)

Allows Rails' engines to contain fixtures for their models and for those fixtures to be automatically used in the downstream engines. This is very much in line with Rails' engines containing db migrations for their models and for those migrations to be automatically used by the downstream engines (as described [here]( http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/)). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inheritable_fixtures'
```

And then execute:

    $ bundle

## Usage

This gem introduces a configuration option called `Rails.application.config.fixtures_paths`, which is by default empty. The list of fixtures is determined by traversing all the `fixtures_paths` looking for fixture files. Note, `<rails root>/test/fixtures` is always prepended to the list and thus it has the highest precedence.   

When the application initializes, each engine adds `todo` to the list (if that path exists).

### fixtures :all

Tests use `fixtures :all` or `fixtures :users, :addresses` to initial the database with necessary test data. The `fixtures` will now search for the fixtures in all `fixtures_paths` in addition to the usual `Rails.root.join('test/fixtures')`.
 
### fixtures\_file\_upload

The `fixture_file_upload` is a handy utility provided by Rails' for creating `Rack::Test::UploadedFile` out of a fixture file. The `fixture_file_upload` will now look for the fixture in all `fixtures_paths` in addition to the usual `Rails.root.join('test/fixtures')`.

### rake db:fixtures:load

The `db:fixtures:load` task is used to populate a database with the fixtures. This task will now load all fixtures from `fixtures_paths` in addition to the usual `Rails.root.join('test/fixtures')`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/inheritable_fixtures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
