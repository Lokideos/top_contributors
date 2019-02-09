# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ContributorsSearchesController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'renders :new template' do
      expect(response).to render_template :new
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    context 'with valid attributes' do
      it 'saves search result in the database' do
        expect do
          post :create, params: { contributors_search: attributes_for(:contributors_search) }
        end.to change(ContributorsSearch, :count).by(1)
      end

      it 'redirects to search results view' do
        post :create, params: { contributors_search: attributes_for(:contributors_search) }
        expect(response).to redirect_to assigns(:contributors_search)
      end
    end

    context 'with invalid attributes' do
      it 'does not save search result in the database' do
        expect do
          post :create, params: { contributors_search: attributes_for(:contributors_search, :invalid) }
        end.to_not change(ContributorsSearch, :count)
      end

      it 're-renders :new template' do
        post :create, params: { contributors_search: attributes_for(:contributors_search, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
