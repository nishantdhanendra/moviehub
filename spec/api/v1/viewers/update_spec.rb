require 'rails_helper'

RSpec.describe "viewers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/viewers/#{viewer.id}", payload
  end

  describe 'basic update' do
    let!(:viewer) { create(:viewer) }

    let(:payload) do
      {
        data: {
          id: viewer.id.to_s,
          type: 'viewers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ViewerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { viewer.reload.attributes }
    end
  end
end
