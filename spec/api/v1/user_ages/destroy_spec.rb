require "rails_helper"

RSpec.describe "user_ages#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_ages/#{user_age.id}"
  end

  describe "basic destroy" do
    let!(:user_age) { create(:user_age) }

    it "updates the resource" do
      expect(UserAgeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserAge.count }.by(-1)
      expect { user_age.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
