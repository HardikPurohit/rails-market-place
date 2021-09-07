# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    return seller_products_path if resource.has_role? :seller
    products_path
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_path = current_user.present? ? after_sign_in_path_for(current_user) : root_path
    redirect_to(request.referrer || redirect_path)
  end
end
