class CardPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

  end

  def show?
    record.user == user
  end

  def new?
    record.user == user
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def redo?
    record.user == user
  end

  def redophrase?
    record.user == user
  end
end
