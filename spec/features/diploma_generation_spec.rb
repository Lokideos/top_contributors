# frozen_string_literal: true

require 'rails_helper'

feature 'User can download diplomas for contribution', "
  In order to get reward for contribution
  As a User
  I'd like to be able to download pdf diplomas for my contributions
" do
  scenario 'User see links for diploma download' do
    visit new_contributors_search_path

    within '.contributors-search' do
      fill_in 'Repository', with: 'https://github.com/rails/rails'
      click_on 'Search'
    end

    expect(page).to have_content 'Download Diploma'
  end
end
