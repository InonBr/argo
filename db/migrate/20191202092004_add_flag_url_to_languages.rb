class AddFlagUrlToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :flag_url, :string
  end
end
