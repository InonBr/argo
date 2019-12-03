class UserLanguagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user ==  user
  end

  def update_languages?
    true
  end
end

