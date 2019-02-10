# frozen_string_literal: true

class CreateDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_table :diplomas do |t|
      t.string :contributor_name, null: false
      t.belongs_to :contributor, foreign_key: true

      t.timestamps
    end
  end
end
