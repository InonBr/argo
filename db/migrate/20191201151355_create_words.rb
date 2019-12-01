class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :original
      t.string :translation
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
