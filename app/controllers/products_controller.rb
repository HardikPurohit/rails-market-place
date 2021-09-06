# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    sql = "select fp.id from products as fp INNER JOIN users on users.id = fp.user_id 
            inner join user_profiles on user_profiles.user_id = users.id where fp.id in (select min(p.id) as id
            from products p join (select product_type_id, min(price) as price from products 
            group by product_type_id) as inp
            on  p.product_type_id = inp.product_type_id
            and p.price = inp.price
            group by p.price, p.product_type_id) and (user_profiles.state_id = #{current_user.state.id})"

    ids = ActiveRecord::Base.connection.exec_query(sql).rows.flatten
    @q = Product.where(id: ids).ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
