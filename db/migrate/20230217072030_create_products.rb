class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :cost
      t.integer :user_id
      t.boolean :sold
      t.integer :buyer_id

      t.timestamps
    end
  end
end
