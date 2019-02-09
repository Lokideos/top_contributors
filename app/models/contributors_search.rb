# frozen_string_literal: true

class ContributorsSearch < ApplicationRecord
  GITHUB_ADDRESS_REGEXP = %r{\Ahttps://github.com/[\w\W]*\z}.freeze

  validates :url, presence: true
  validates :url, format: { with: GITHUB_ADDRESS_REGEXP, message: 'is not correct url to github repository.' }
end
