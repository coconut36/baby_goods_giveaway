require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:messages_received) }

    it { should have_many(:messages_sent) }

    it { should have_many(:products) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
