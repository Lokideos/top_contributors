# frozen_string_literal: true

class ContributorsSearch < ApplicationRecord
  GITHUB_ADDRESS_REGEXP = %r{\Ahttps://github.com/[\w\W]*\z}.freeze

  after_create_commit :create_contributors

  has_many :contributors, dependent: :destroy

  validates :url, presence: true
  validates :url, format: { with: GITHUB_ADDRESS_REGEXP, message: 'is not correct url to github repository.' }

  def create_contributors
    Services::GithubTopContributors.new(url).call.each do |contributor|
      Contributor.create!(name: contributor.login, contributors_search: self)
    end
  end
end
