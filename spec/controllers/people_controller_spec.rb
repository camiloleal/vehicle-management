require 'rails_helper'

RSpec.describe API::V1::PeopleController, type: :controller do
  fixtures :all

  describe 'GET #index' do
    it 'returns a successful 200 response' do
      get :index, format: :json
      expect(response).to have_http_status(:successful)
    end

    it 'returns all people' do
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
    end
  end

  describe 'GET #show' do
    let(:person) { people(:person_one) }

    it 'returns a successful 200 response' do
      get :show, params: { id: person.id }
      expect(response).to have_http_status(:successful)
    end

    it 'returns person information' do
      get :show, params: { id: person.id }
      json_response = JSON.parse(response.body)
      expect(json_response).to_not be_nil
    end
  end

  describe 'POST #create' do
    context 'with correct information' do
      it 'returns a successful json' do
        post :create, params: { person: { name: 'lina', document_number: 11 } }
        expect(response).to have_http_status(:successful)
        json_response = JSON.parse(response.body)
        expect(json_response).to_not be_nil
      end
    end

    context 'with wrong information' do
      it 'returns an bad bad_request status' do
        post :create, params: { person: { name: 'Mateo' } }
        expect(response).to be_bad_request
      end
    end
  end

  describe 'PUT #update' do
    let(:person) { people(:person_one) }

    it 'returns a successful 200 response' do
      get :update,
        params: {
          id: person.id,
          person: { name: 'Jean' }
        }
      expect(response).to have_http_status(:successful)
    end

    it 'returns an bad bad_request status' do
      get :update,
        params: {
          id: person.id,
          person: { document_number: '987654321' }
        }
      expect(response).to be_bad_request
    end
  end

  describe 'PUT #delete' do
    let(:person) { people(:person_one) }

    it 'returns a status 204 response' do
      delete :destroy, params: { id: person.id }
      expect(response).to have_http_status(:successful)
    end
  end
end
