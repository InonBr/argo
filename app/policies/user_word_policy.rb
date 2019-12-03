class UserWordPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def search?
    new?
  end
end
