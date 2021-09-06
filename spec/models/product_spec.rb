require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'When sku is not present' do
      it 'returns false' do
        product = build(:product, sku: nil)
        expect(product.save).to be_falsey
      end
    end

    context 'When sku is already present' do
      it 'return false' do
        product1 = create(:product)
        product2 = build(:product)
        expect(product2.save).to be_falsey
      end
    end

    context 'When price is not present' do
      it 'returns false' do
        product = build(:product, price: nil)
        expect(product.save).to be_falsey
      end
    end

    context 'When quantity is not present' do
      it 'returns false' do
        product = build(:product, quantity: nil)
        expect(product.save).to be_falsey
      end
    end

    context 'When user is not present' do
      it 'returns false' do
        product = build(:product, user_id: nil)
        expect(product.save).to be_falsey
      end
    end

    context 'When product type is not present' do
      it 'returns false' do
        product = build(:product, product_type_id: nil)
        expect(product.save).to be_falsey
      end
    end

    context '#name' do
      it 'returns name of product type' do
        product = create(:product)
        expect(product.name).to eq 'test product'
      end
    end

    context '#user_name' do
      it 'returns name of user' do
        user = create(:user)
        user_profile = create(:user_profile, user: user)
        product = create(:product, user: user)
        expect(product.user_name).to eq 'test'
      end
    end
  end
end