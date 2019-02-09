# frozen_string_literal: true

require 'rails_helper'

feature 'User can retrieve top contributors from github repository', "
  In order to check top contributors
  As a User
  I'd like to be able to retrieve top contributors from given github repository
" do
  scenario 'User retrieves top contributors from github repository' do
    visit new_contributors_searches_path

    within '.contributors-search' do
      fill_in 'Search', with: 'https://github.com/rails/rails'
      click_on 'Search'
    end

    expect(page).to have_content 'dhh'
    expect(page).to have_content 'refael'
    expect(page).to have_content 'tenderlove'
  end

  scenario 'User tries to retrieve top contributors with using bad repository url'
end
