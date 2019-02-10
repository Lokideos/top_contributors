# frozen_string_literal: true

class Contributor < ApplicationRecord
  has_one :diploma, dependent: :destroy
  belongs_to :contributors_search

  validates :name, presence: true
end
