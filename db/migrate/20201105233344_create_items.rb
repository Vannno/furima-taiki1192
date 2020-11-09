class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false 
      t.text :item_info, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :burden_charges_id, null: false
      t.integer :delivery_source_id, null: false
      t.integer :days_ship_id, null: false
      t.integer :value, null:false
      t.references :user, foreign_key: true
      t.timestamps 
    end
  end
end
