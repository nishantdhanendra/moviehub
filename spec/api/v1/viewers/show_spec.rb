require 'rails_helper'

RSpec.describe "viewers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/viewers/#{viewer.id}", params: params
  end

  describe 'basic fetch' do
    let!(:viewer) { create(:viewer) }

    it 'works' do
      expect(ViewerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('viewers')
      expect(d.id).to eq(viewer.id)
    end
  end
end
