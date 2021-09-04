# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.joins(user: :user_profile).where('user_profiles.state_id = ?', current_user.state.id)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

end
