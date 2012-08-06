class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :list_name
      t.string :list_item1
      t.string :list_item2
      t.string :list_item3
      t.string :list_item4
      t.string :list_item5
      t.string :list_item6
      t.string :list_item7
      t.string :list_item8
      t.string :list_item9
      t.string :list_item10
      t.integer :user_id

      t.timestamps
    end
    add_index :lists, :user_id
  end
end
