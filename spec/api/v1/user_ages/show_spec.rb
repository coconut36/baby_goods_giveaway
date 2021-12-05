require "rails_helper"

RSpec.describe "user_ages#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_ages/#{user_age.id}", params: params
  end

  describe "basic fetch" do
    let!(:user_age) { create(:user_age) }

    it "works" do
      expect(UserAgeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("user_ages")
      expect(d.id).to eq(user_age.id)
    end
  end
end
