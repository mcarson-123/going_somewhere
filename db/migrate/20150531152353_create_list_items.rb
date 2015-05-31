class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :list
      t.string :name
      t.integer :quantity
      t.integer :source, null: false, default: 0
      t.string :category
      t.timestamps null: false
    end
  end
end
