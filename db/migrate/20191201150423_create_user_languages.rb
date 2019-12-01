class CreateUserLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_languages do |t|
      t.boolean :active
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
