require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:age_group) }

    it { should belong_to(:category) }

    it { should have_many(:messages) }

    it { should belong_to(:giver) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
