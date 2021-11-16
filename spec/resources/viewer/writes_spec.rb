require "rails_helper"

RSpec.describe ViewerResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "viewers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ViewerResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Viewer.count }.by(1)
    end
  end

  describe "updating" do
    let!(:viewer) { create(:viewer) }

    let(:payload) do
      {
        data: {
          id: viewer.id.to_s,
          type: "viewers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ViewerResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { viewer.reload.updated_at }
      # .and change { viewer.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:viewer) { create(:viewer) }

    let(:instance) do
      ViewerResource.find(id: viewer.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Viewer.count }.by(-1)
    end
  end
end
