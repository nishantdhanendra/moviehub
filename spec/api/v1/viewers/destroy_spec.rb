require 'rails_helper'

RSpec.describe "viewers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/viewers/#{viewer.id}"
  end

  describe 'basic destroy' do
    let!(:viewer) { create(:viewer) }

    it 'updates the resource' do
      expect(ViewerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Viewer.count }.by(-1)
      expect { viewer.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
