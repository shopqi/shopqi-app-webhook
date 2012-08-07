require "#{ShopQiAppWebhook::Engine.models_dir}/shop"
require "#{ShopQiApp::Engine.models_dir}/shop" # methods: use_shopkit admin_url front_url
class Shop
  has_many :orders
  attr_accessible :shop_id, :name, :shopqi_domain
end
