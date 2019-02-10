# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diploma, type: :model do
  it { should belong_to :contributor }
  it { should validate_presence_of :contributor_name }
end
