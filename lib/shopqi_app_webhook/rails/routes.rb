module ShopQiAppWebhook
  module Rails
    class Routes
      module Helper
        def use_shopqi_webhook(options = {}, &block)
          self.post '/webhook', to: 'webhook#orders_fulfilled'#, format: :json
          #self.mount Resque::Server.new, :at => "/resque"
        end
      end

      def self.install
        ActionDispatch::Routing::Mapper.send :include, ShopQiAppWebhook::Rails::Routes::Helper
      end
    end
  end
end
