class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :trip
      t.string :name
      t.timestamps null: false
    end
  end
end
