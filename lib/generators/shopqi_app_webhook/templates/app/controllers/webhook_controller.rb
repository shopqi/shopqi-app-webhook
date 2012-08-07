class WebhookController < ShopQiAppWebhook::WebhookController

  def orders_fulfilled
    order = JSON(request.body.read)['order']
    shop.orders.where(order_id: order_id).first_or_create!({
      name: order['name'],
      financial_status_name: order['financial_status_name'],
      financial_status: order['financial_status'],
      fulfillment_status: order['fulfillment_status'],
      fulfillment_status_name: order['fulfillment_status_name'],
      order_id: order['id'],
      total_price: order['total_price'],
      created_at: order['created_at']
    })
    render nothing: true
  end

end
