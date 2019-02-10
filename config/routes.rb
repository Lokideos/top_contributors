# frozen_string_literal: true

Rails.application.routes.draw do
  resources :contributors_searches, only: %i[new create show]
  resources :diplomas, only: :show

  root to: 'contributors_searches#new'
end
