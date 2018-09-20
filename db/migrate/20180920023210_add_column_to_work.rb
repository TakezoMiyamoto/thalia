class AddColumnToWork < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :title, :string
    add_column :works, :description, :text
    add_column :works, :youtube_url, :string
  end
end
