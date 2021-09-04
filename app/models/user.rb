# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :user_profile, allow_destroy: true

  def state
    user_profile.state
  end
end
