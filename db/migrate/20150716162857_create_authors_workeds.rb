class CreateAuthorsWorkeds < ActiveRecord::Migration
  def change
    create_table :authors_workeds do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
