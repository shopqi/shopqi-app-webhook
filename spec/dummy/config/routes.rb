Rails.application.routes.draw do

  mount ShopQiAppWebhook::Engine => "/shopqi-app-webhook"
end
