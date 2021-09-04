# frozen_string_literal: true

class State < ApplicationRecord
  has_many :user_profiles, dependent: :destroy
  has_many :products, dependent: :destroy
end
