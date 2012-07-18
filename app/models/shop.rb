require "#{ShopQiApp::Engine.models_dir}/shop"
class Shop
  after_create :add_webhook

  def add_webhook
    Resque.enqueue(WebhookWorker, self.id)
  end
end
