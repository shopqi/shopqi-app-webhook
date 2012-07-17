# encoding: utf-8
require 'spec_helper'

describe WebhookController do

  let(:shop) { FactoryGirl.create(:shop) }

  context 'with signature' do

    context 'orders_fulfilled' do

      it 'should be success', f: true do
        expect do
          order = { name: '订单 #1', id: 1, created_at: Time.now }
          data = {order: order}.to_json
          digest  = OpenSSL::Digest::Digest.new('sha256')
          sign = Base64.encode64(OpenSSL::HMAC.digest(digest, SecretSetting.oauth.secret, data)).strip
          request.env['HTTP_X_SHOPQI_HMAC_SHA256'] = sign
          request.env['HTTP_X_SHOPQI_DOMAIN'] = shop.shopqi_domain
          request.env['RAW_POST_DATA'] = data
          post :orders_fulfilled
          response.should be_success
        end.should change(Order, :count).by(1)
      end

    end

  end

  context 'without signature' do

    context 'orders_fulfilled' do

      it 'should be faild' do
        expect do
          request.env['x_SHOPQI_DOMAIN'] = shop.shopqi_domain
          post :orders_fulfilled, order: { name: '订单 #1', id: 1, created_at: Time.now }
          JSON(response.body)['errors'].should eql 'Signature invalid'
        end.should_not change(Order, :count)
      end

  end

  end

end
