require "rails_helper"

RSpec.describe UserAgeResource, type: :resource do
  describe "serialization" do
    let!(:user_age) { create(:user_age) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_age.id)
      expect(data.jsonapi_type).to eq("user_ages")
    end
  end

  describe "filtering" do
    let!(:user_age1) { create(:user_age) }
    let!(:user_age2) { create(:user_age) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_age2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_age2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_age1) { create(:user_age) }
      let!(:user_age2) { create(:user_age) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_age1.id,
                                      user_age2.id,
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
                                      user_age2.id,
                                      user_age1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
