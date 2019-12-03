class LanguagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
 


  def show?
    user
  end

end
