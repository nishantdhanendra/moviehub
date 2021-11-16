require "rails_helper"

RSpec.describe "viewers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/viewers", params: params
  end

  describe "basic fetch" do
    let!(:viewer1) { create(:viewer) }
    let!(:viewer2) { create(:viewer) }

    it "works" do
      expect(ViewerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["viewers"])
      expect(d.map(&:id)).to match_array([viewer1.id, viewer2.id])
    end
  end
end
