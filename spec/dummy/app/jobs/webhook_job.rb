# encoding: utf-8
class WebhookJob < Struct.new(:shop_id)

  def perform
    Shop.find(shop_id).use_shopkit
    Shopkit.create_webhook event: 'orders/fulfilled', callback_url: "http://#{SecretSetting.domain.host}/webhook"
  end

end
