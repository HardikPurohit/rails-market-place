# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :product_type

  validates :sku, :price, :quantity, presence: true
  validates :sku, uniqueness: true

  def name
    product_type.try(:name)
  end

  def user_name
    user.try(:user_profile).try(:name)
  end
end
