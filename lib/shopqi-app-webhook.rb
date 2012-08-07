require "shopqi_app_webhook/engine"
require "delayed_job_active_record"

module ShopQiAppWebhook

  module Rails
    autoload :Routes, "shopqi_app_webhook/rails/routes"
  end

end
