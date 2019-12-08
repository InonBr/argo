class UserWordPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def search?
    new?
  end

  def destroy?
    record.user == user
  end
end
