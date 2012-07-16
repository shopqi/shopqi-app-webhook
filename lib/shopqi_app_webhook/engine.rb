module ShopQiAppWebhook
  class Engine < ::Rails::Engine
    isolate_namespace ShopQiAppWebhook
    engine_name 'shopqi_app_webhook'

    initializer "shopqi_app_webhook.routes" do
      ShopQiAppWebhook::Rails::Routes.install
    end

    initializer "shopqi_app.acronym" do
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'ShopQi'
      end
    end

    initializer "shopqi_app_webhook.resque" do
      require 'resque/server'
      current_app_name = ::Rails.application.class.to_s.split("::").first
      Resque.redis.namespace = "resque:#{current_app_name}"
    end

  end
end
