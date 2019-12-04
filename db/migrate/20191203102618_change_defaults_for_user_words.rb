class ChangeDefaultsForUserWords < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_words, :quizzed, false
    change_column_default :user_words, :knew, false
    change_column_default :user_words, :removed, false
  end
end
