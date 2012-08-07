class Order < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :name, :financial_status, :financial_status_name, :fulfillment_status, :fulfillment_status_name, :order_id, :total_price, :created_at

  def admin_url
    "#{shop.admin_url}/orders/#{order_id}"
  end
end
