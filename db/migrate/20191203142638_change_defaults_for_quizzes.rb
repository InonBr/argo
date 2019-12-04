class ChangeDefaultsForQuizzes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :quizzes, :score, 0
  end
end
