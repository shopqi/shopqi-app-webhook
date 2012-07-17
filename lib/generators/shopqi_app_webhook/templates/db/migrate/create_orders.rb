class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :shop    , null: false
      t.integer :order_id   , unique: true, null: false
      t.string :name        , limit: 32   , null: false
      t.float :total_price  , null: false
      t.datetime :created_at
    end
    add_index :orders, :shop_id, unique: true
  end
end
