require "rails_helper"

RSpec.describe "user_ages#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_ages/#{user_age.id}", payload
  end

  describe "basic update" do
    let!(:user_age) { create(:user_age) }

    let(:payload) do
      {
        data: {
          id: user_age.id.to_s,
          type: "user_ages",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserAgeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_age.reload.attributes }
    end
  end
end
