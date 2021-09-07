# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def index?
    check_authority
  end

  def new?
    check_authority
  end

  def create?
    check_authority
  end

  def edit?
    check_authority
  end

  def update?
    check_authority
  end

  def destroy?
    check_authority
  end

  class Scope < Scope
    def resolve
      if @user.present? && @user.has_role?(:seller)
        @user.products
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end
end
