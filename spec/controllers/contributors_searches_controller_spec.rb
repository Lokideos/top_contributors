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

  describe 'POST #create' do
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

  describe 'GET #show' do
    let(:contributors_search) { create(:contributors_search) }

    context 'general show test' do
      before { get :show, params: { id: contributors_search } }

      it 'renders :show template' do
        expect(response).to render_template :show
      end

      it 'returns 200 OK status' do
        expect(response).to have_http_status :ok
      end
    end

    it 'renders html for html request' do
      get :show, params: { id: contributors_search, format: :html }

      expect(response.header['Content-Type']).to include 'text/html'
    end

    it 'returns zip for zip request' do
      get :show, params: { id: contributors_search, format: :zip }

      expect(response.header['Content-Type']).to include 'zip'
    end
  end
end
# rubocop:enable Metrics/BlockLength
