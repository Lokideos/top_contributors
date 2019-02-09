# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContributorsSearch, type: :model do
  it { should validate_presence_of :url }
  it { should allow_value('https://github.com/rails/rails').for(:url) }
  it { should_not allow_value('DIO').for(:url) }
end
