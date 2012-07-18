require "#{ShopQiAppWebhook::Engine.models_dir}/shop"
require "#{ShopQiApp::Engine.models_dir}/shop"
class Shop
  has_many :orders
  attr_accessible :shop_id, :name, :shopqi_domain, :access_token
end
