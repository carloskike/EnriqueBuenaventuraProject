class AddFieldnameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :attachment, :string
  end
end
