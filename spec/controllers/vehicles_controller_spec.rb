require 'rails_helper'

RSpec.describe API::V1::VehiclesController, type: :controller do
  fixtures :all

  describe 'GET #index' do
    it 'returns a successful 200 response' do
      get :index, format: :json
      expect(response).to have_http_status(:successful)
    end

    it 'returns all vehicles' do
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 3
    end
  end

  describe 'GET #show' do
    let(:vehicle) { vehicles(:vehicle_one) }

    it 'returns a successful 200 response' do
      get :show, params: { id: vehicle.id }, format: :json
      expect(response).to have_http_status(:successful)
    end

    it 'returns vehicle information' do
      get :show, params: { id: vehicle.id }, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response).to_not be_nil
    end
  end

  describe 'POST #create' do
    context 'with correct information' do
      it 'returns a successful json' do
        post :create,
          params: {
            vehicle: {
              plate: 'QWE123', branch: 'audi', category: 'SUV', person_id: 1
            }
          }
        expect(response).to have_http_status(:successful)
        json_response = JSON.parse(response.body)
        expect(json_response).to_not be_nil
      end
    end

    context 'with wrong information' do
      it 'returns an bad bad_request status' do
        post :create, params: { vehicle: { plate: 'MNA432' } }
        expect(response).to be_bad_request
      end
    end
  end

  describe 'PUT #update' do
    let(:vehicle) { vehicles(:vehicle_one) }

    it 'returns a successful 200 response' do
      get :update,
        params: {
          id: vehicle.id,
          vehicle: { category: 'sedan' }
        }
      expect(response).to have_http_status(:successful)
    end

    it 'returns an bad bad_request status' do
      get :update,
        params: {
          id: vehicle.id,
          vehicle: { plate: 'BBB123' }
        }
      expect(response).to be_bad_request
    end
  end

  describe 'PUT #delete' do
    let(:vehicle_one) { vehicles(:vehicle_one) }

    it 'returns a status 204 response' do
      delete :destroy, params: { id: vehicle_one.id }
      expect(response).to have_http_status(:successful)
    end
  end
end
