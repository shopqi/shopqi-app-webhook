Rails.application.routes.draw do
  use_shopqi
  use_shopqi_webhook
  root :to => 'home#index'
end
