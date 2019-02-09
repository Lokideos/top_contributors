# frozen_string_literal: true

class CreateContributorsSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors_searches do |t|
      t.string :url, null: false

      t.timestamps
    end
  end
end
