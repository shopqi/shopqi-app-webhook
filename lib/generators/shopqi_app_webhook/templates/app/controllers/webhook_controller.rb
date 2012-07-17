class WebhookController < ShopQiAppWebhook::WebhookController

  def orders_fulfilled
    attrs = JSON(request.body.read)['order']
    shop.orders.where(order_id: order_id).first_or_create! name: attrs['name'], order_id: attrs['id'], total_price: attrs['total_price'], created_at: attrs['created_at']
    render nothing: true
  end

end
