require "shopqi_app_webhook/engine"
require "delayed_job"

module ShopQiAppWebhook

  module Rails
    autoload :Routes, "shopqi_app_webhook/rails/routes"
  end

end
