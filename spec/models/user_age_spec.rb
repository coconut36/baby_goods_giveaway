require "rails_helper"

RSpec.describe UserAge, type: :model do
  describe "Direct Associations" do
    it { should have_many(:products) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
