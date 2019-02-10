# frozen_string_literal: true

class Contributor < ApplicationRecord
  after_create_commit { create_diploma(contributor_name: name) }

  has_one :diploma, dependent: :destroy
  belongs_to :contributors_search

  validates :name, presence: true
end
