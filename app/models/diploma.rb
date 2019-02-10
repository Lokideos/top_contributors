# frozen_string_literal: true

class Diploma < ApplicationRecord
  belongs_to :contributor

  validates :contributor_name, presence: true
end
