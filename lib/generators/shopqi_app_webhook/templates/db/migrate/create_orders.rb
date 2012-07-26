class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :shop               , null: false
      t.integer :order_id              , null: false, unique: true
      t.string :name                   , null: false, limit: 32
      t.string :financial_status       , null: false, limit: 16
      t.string :financial_status_name  , null: false, limit: 32
      t.string :fulfillment_status     , null: false, limit: 16
      t.string :fulfillment_status_name, null: false, limit: 32
      t.float :total_price             , null: false
      t.datetime :created_at           , null: false
    end
    add_index :orders, :order_id, unique: true
  end
end
