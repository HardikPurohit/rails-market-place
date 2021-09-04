# frozen_string_literal: true

class Seller::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: %i[edit update show destroy]
  before_action :get_product_types, only: %i[new create edit update]

  def index
    @products = policy_scope(Product)
  end

  def new
    @product = current_user.products.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      flash[:success] = t(params[:action], resource: 'Product')
      redirect_to seller_products_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t(params[:action], resource: 'Product')
      redirect_to seller_products_path
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    if @product.destroy
      flash[:success] = t(params[:action], resource: 'Product')
      redirect_to seller_products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:sku, :price, :quantity, :user_id, :product_type_id)
  end

  def find_product
    @product = policy_scope(Product).find_by(id: params[:id])
  end

  def get_product_types
    @product_types = ProductType.pluck(:name, :id)
  end
end
