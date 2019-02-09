# frozen_string_literal: true

class Services::GithubTopContributors
  def initialize(repository_url, contribs_quantity: 3, client: nil)
    @address = Octokit::Repository.from_url(repository_url)
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
    @quantity = contribs_quantity
  end

  def call
    contributors = @client.contribs(@address)
    contributors.slice!(@quantity..contributors.size - 1)
    contributors
  end
end
