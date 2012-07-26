class WebhookController < ShopQiAppWebhook::WebhookController

  def orders_fulfilled
    attrs = JSON(request.body.read)['order']
    shop.orders.where(order_id: order_id).first_or_create!({
      name: attrs['name'],
      financial_status_name: attrs['financial_status_name'],
      financial_status: attrs['financial_status'],
      fulfillment_status: attrs['fulfillment_status'],
      fulfillment_status_name: attrs['fulfillment_status_name'],
      order_id: attrs['id'],
      total_price: attrs['total_price'],
      created_at: attrs['created_at']
    })
    render nothing: true
  end

end
