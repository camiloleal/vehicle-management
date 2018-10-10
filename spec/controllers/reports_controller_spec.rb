require 'rails_helper'

RSpec.describe API::V1::ReportsController, type: :controller do
  describe 'GET #new' do
    context 'with correct parameters' do
      it 'returns a successful 200 response' do
        get :new, params: { type: 'vehicles', format: 'csv' }
        expect(response).to have_http_status(:successful)
      end
    end

    context 'with wrong parameters' do
      it 'returns an bad not_acceptable status' do
        get :new, params: { type: '', format: 'csv' }
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  end
end
