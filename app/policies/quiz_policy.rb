class QuizPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def questions?
    show?
  end

  def answer?
    show?
  end

  def starter?
    true
  end
end
