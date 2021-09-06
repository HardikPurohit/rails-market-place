require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'When email is not present' do
      it 'returns user count zero' do
        user = build(:user, email: nil)
        user.save
        expect(User.count).to eq 0
      end
    end

    context 'When password is not present' do
      it 'returns user count zero' do
        user = build(:user, password: nil)
        user.save
        expect(User.count).to eq 0
      end
    end

    context '#state' do
      it 'returns state of user' do
        user = create(:user)
        state = create(:state)
        user_profile = create(:user_profile, user_id: user.id, state_id: state.id)
        expect(user.state).to eq state
      end
    end
  end
end
