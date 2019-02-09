# frozen_string_literal: true

require 'rails_helper'

feature 'User can retrieve top contributors from github repository', "
  In order to check top contributors
  As a User
  I'd like to be able to retrieve top contributors from given github repository
" do
  scenario 'User retrieves top contributors from github repository' do
    visit new_contributors_search_path

    within '.contributors-search' do
      fill_in 'Repository', with: 'https://github.com/rails/rails'
      click_on 'Search'
    end

    expect(page).to have_content 'dhh'
    expect(page).to have_content 'rafaelfranca'
    expect(page).to have_content 'tenderlove'
  end

  scenario 'User tries to retrieve top contributors with using bad repository url' do
    visit new_contributors_search_path

    within '.contributors-search' do
      fill_in 'Repository', with: 'Za Warudo'
      click_on 'Search'
    end

    expect(page).to_not have_content 'dhh'
    expect(page).to have_content 'You have provided bad url.'
  end
end
