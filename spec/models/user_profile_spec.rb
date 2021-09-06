require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  describe 'Validations' do
    context 'When state is not present' do
      it 'return false when save the record' do
        user_profile = build(:user_profile, state_id: nil)
        expect(user_profile.save).to be_falsey
      end
    end

    context 'When user is not present' do
      it 'return false when save the record' do
        user_profile = build(:user_profile, user_id: nil)
        expect(user_profile.save).to be_falsey
      end
    end
  end
end