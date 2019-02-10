# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contributor, type: :model do
  it { should have_one(:diploma).dependent(:destroy) }
  it { should belong_to :contributors_search }
  it { should validate_presence_of :name }

  it 'triggers #create_diploma after create & commit' do
    contributor = build(:contributor)
    expect(contributor).to receive(:create_diploma).with(contributor_name: contributor.name)
    contributor.save
  end
end
