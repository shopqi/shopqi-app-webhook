Rails.application.routes.draw do
  root :to => 'home#index'

  use_shopqi

end
