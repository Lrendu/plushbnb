class PlushPolicy < ApplicationPolicy
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

  def destroy?
    true
  end

  #def update?
   # true
  #end

 # def edit?
  #  true
  #end


end
