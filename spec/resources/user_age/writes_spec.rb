require 'rails_helper'

RSpec.describe UserAgeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'user_ages',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UserAgeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UserAge.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:user_age) { create(:user_age) }

    let(:payload) do
      {
        data: {
          id: user_age.id.to_s,
          type: 'user_ages',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UserAgeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { user_age.reload.updated_at }
      # .and change { user_age.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:user_age) { create(:user_age) }

    let(:instance) do
      UserAgeResource.find(id: user_age.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UserAge.count }.by(-1)
    end
  end
end
