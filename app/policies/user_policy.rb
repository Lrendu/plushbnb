class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  def user_profile?
    true
  end

  def user_plushes?
    true
  end

  def delete_plush?
    true
  end
end
