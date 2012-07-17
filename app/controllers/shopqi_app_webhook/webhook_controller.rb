module ShopQiAppWebhook
  class WebhookController < ApplicationController
    skip_before_filter :verify_authenticity_token
    skip_before_filter :authenticate_shop!
    before_filter :check_source # 检查是否来自 ShopQi
    before_filter :check_shop

    def orders_fulfilled
      render nothing: true
    end

    protected
    def check_source
      shopqi_sign = request.headers['HTTP_X_SHOPQI_HMAC_SHA256']
      data = request.body.read
      request.body.rewind
      digest  = OpenSSL::Digest::Digest.new('sha256')
      sign = Base64.encode64(OpenSSL::HMAC.digest(digest, SecretSetting.oauth.secret, data)).strip
      render json: { errors: 'Signature invalid' } and return unless sign == shopqi_sign
    end

    def check_shop
      render json: { errors: 'Domain invalid' } and return unless shop
    end

    def shop
      domain = request.headers['HTTP_X_SHOPQI_DOMAIN']
      @shop ||= Shop.find_by_shopqi_domain(domain) unless domain.blank?
    end

    def order_id
      request.headers['HTTP_X_SHOPQI_ORDER_ID']
    end

  end
end
