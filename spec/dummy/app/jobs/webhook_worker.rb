# encoding: utf-8
module WebhookWorker

  @queue = "webhook_worker"

  def self.perform(shop_id)
    shop = Shop.find(shop_id)
    Shopkit.setup url: shop.shopqi_domain, access_token: shop.access_token
    Shopkit.create_webhook event: 'orders/fulfilled', callback_url: "http://#{SecretSetting.domain.host}/webhook"
  end

end
