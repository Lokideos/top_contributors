# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::GithubTopContributors do
  let(:correct_repository_url) { 'https://github.com/rails/rails' }

  describe '#call' do
    it 'should return array of top contributors' do
      expect(Services::GithubTopContributors.new(correct_repository_url).call).to be_a(Array)
    end

    it 'should return top 3 contributors' do
      expect(Services::GithubTopContributors.new(correct_repository_url).call.size).to eq 3
    end

    it 'should raise Octokit::InvalidRepository error if url is not correct' do
      expect { Services::GithubTopContributors.new('bad_repo').call }.to raise_error(Octokit::InvalidRepository)
    end
  end
end
