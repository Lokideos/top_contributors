# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiplomasController, type: :controller do
  let(:diploma) { create(:diploma) }
  describe 'GET #show' do
    before { get :show, params: { id: diploma } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders :show template' do
      expect(response).to render_template :show
    end
  end
end
