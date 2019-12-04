class LanguagePolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def show?
    user
  end

  def update_languages?
    user
  end
end

