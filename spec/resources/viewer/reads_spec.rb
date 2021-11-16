require "rails_helper"

RSpec.describe ViewerResource, type: :resource do
  describe "serialization" do
    let!(:viewer) { create(:viewer) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(viewer.id)
      expect(data.jsonapi_type).to eq("viewers")
    end
  end

  describe "filtering" do
    let!(:viewer1) { create(:viewer) }
    let!(:viewer2) { create(:viewer) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: viewer2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([viewer2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:viewer1) { create(:viewer) }
      let!(:viewer2) { create(:viewer) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      viewer1.id,
                                      viewer2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      viewer2.id,
                                      viewer1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
