# frozen_string_literal: true

class Schema < ActiveRecord::Migration["#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"]
  def self.up
    # suppress_messages do
      create_table :countries do |t|
        t.string :name

        t.timestamps
      end

      create_table :states do |t|
        t.string :name

        t.timestamps
      end

      create_table :cities do |t|
        t.string :name

        t.timestamps
      end
    # end
  end
end
