require "rails_helper"

RSpec.describe Viewer, type: :model do
  describe "Direct Associations" do
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:movie_id) }
  end
end
