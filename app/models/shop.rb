require "#{ShopQiApp::Engine.models_dir}/shop"
class Shop
  after_create :add_webhook

  def add_webhook
    Delayed::Job.enqueue WebhookJob.new(self.id)
  end
end
