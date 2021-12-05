require "rails_helper"

RSpec.describe "user_ages#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_ages", params: params
  end

  describe "basic fetch" do
    let!(:user_age1) { create(:user_age) }
    let!(:user_age2) { create(:user_age) }

    it "works" do
      expect(UserAgeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_ages"])
      expect(d.map(&:id)).to match_array([user_age1.id, user_age2.id])
    end
  end
end
