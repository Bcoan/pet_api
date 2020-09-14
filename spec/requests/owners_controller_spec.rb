# frozen_string_literal: true

require 'rails_helper'

describe V1::OwnersController, type: :request do
  describe 'POST /owners' do
    subject { post v1_owners_path, params: data }

    context 'valid request' do
      let(:data) do
        { owner: {
          name: 'Bruno',
          document: '08479154098',
          birth_date: '1990-01-01'
        } }
      end

      it 'returns success' do
        subject
        expect(response).to have_http_status(:created)
      end

      it 'returns json response with id' do
        subject
        expect(response.body).to include('id')
      end
    end

    context 'invalid request' do
      let(:data) do
        { owner: {
          name: 2
        } }
      end

      it 'returns an error' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /owners/1' do
    subject { get v1_owner_path(owner) }

    context 'valid owner' do
      let(:owner) { create(:owner) }

      it 'returns success' do
        subject
        expect(response).to have_http_status(:success)
      end
    end

    context 'invalid owner' do
      let(:owner) { '2' }

      it 'returns success' do
        subject
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE /owners/1' do
    subject { delete v1_owner_path(owner) }

    context 'valid owner' do
      let!(:owner) { create(:owner) }

      it 'returns success' do
        subject
        expect(response).to have_http_status(:success)
      end

      it 'removes resource from database' do
        expect { subject }.to change { Owner.count }.from(1).to(0)
      end
    end
  end
end
