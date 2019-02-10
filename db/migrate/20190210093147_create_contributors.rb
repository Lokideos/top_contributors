# frozen_string_literal: true

class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :name, null: false
      t.belongs_to :contributors_search, foreign_key: true

      t.timestamps
    end
  end
end
