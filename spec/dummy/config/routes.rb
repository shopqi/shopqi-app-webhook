Rails.application.routes.draw do

  mount ShopqiAppWebhook::Engine => "/shopqi-app-webhook"
end
