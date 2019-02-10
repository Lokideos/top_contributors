# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContributorsSearch, type: :model do
  it { should have_many(:contributors).dependent(:destroy) }
  it { should validate_presence_of :url }
  it { should allow_value('https://github.com/rails/rails').for(:url) }
  it { should_not allow_value('DIO').for(:url) }

  describe '#create_contributors' do
    it 'should create contributors' do
      contributors_search = build(:contributors_search)
      expect { contributors_search.save }.to change(Contributor, :count).by(3)
    end
  end

  it 'triggers :create_contributors after create & commit' do
    contributors_search = build(:contributors_search)
    expect(contributors_search).to receive(:create_contributors)
    contributors_search.save
  end

  describe '#generate_zip' do
    let(:contribution_search) { create(:contributors_search) }

    it 'returns StringIO object' do
      expect(contribution_search.generate_zip).to be_a(StringIO)
    end
  end
end
