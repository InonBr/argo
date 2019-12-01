class CreateUserWords < ActiveRecord::Migration[5.2]
  def change
    create_table :user_words do |t|
      t.boolean :quizzed
      t.boolean :removed
      t.boolean :knew
      t.references :user, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
