# frozen_string_literal: true

class ContributorsSearch < ApplicationRecord
  GITHUB_ADDRESS_REGEXP = %r{\Ahttps://github.com/[\w\W]*\z}.freeze

  after_create_commit { :create_contributors }

  has_many :contributors, dependent: :destroy

  validates :url, presence: true
  validates :url, format: { with: GITHUB_ADDRESS_REGEXP, message: 'is not correct url to github repository.' }

  private

  def create_contributors
    @contributors = Services::GithubTopContributors.new(contributors_search.url).call
    @contributors.each do |contributor|
      Contributor.create!(name: contributor.login)
    end
  end
end
