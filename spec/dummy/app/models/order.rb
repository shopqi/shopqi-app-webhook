class Order < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :name, :order_id, :total_price, :created_at
end
