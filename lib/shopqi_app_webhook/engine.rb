module ShopQiAppWebhook
  class Engine < Rails::Engine
    isolate_namespace ShopQiAppWebhook
    engine_name 'shopqi_app_webhook'

    def models_dir
      root.join 'app', 'models'
    end

    initializer "shopqi_app_webhook.routes" do
      ShopQiAppWebhook::Rails::Routes.install
    end

    initializer "shopqi_app.acronym" do
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'ShopQi'
      end
    end

  end
end
