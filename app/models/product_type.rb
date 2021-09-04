# frozen_string_literal: true

class ProductType < ApplicationRecord
  has_many :products, dependent: :destroy
end
