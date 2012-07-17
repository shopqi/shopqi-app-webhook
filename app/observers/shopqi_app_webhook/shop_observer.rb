module ShopQiAppWebhook
  class ShopObserver < ActiveRecord::Observer
    observe :shop

    def after_create(shop)
      Resque.enqueue(WebhookWorker, shop.id)
    end
  end
end
