class AddTitleToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :title, :string
  end
end
