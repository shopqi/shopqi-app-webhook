# encoding: utf-8
require 'spec_helper'

describe WebhookController do

  let(:shop) { FactoryGirl.create(:shop) }

  let(:created_at) { Time.parse('2012-07-17 12:12:12') }

  let(:order) do
    {
      id: 1,
      name: '订单 #1',
      financial_status: :paided,
      financial_status_name: '已支付',
      fulfillment_status: :unshipped,
      fulfillment_status_name: '已发货',
      total_price: 45,
      created_at: created_at
    }
  end

  before do
    stub_request(:post, "http://myshopqi.shopqi.com/api/webhooks.json")
  end

  context 'with signature' do

    context 'orders_fulfilled' do

      it 'should be success', f: true do
        expect do
          data = {order: order}.to_json
          digest  = OpenSSL::Digest::Digest.new('sha256')
          sign = Base64.encode64(OpenSSL::HMAC.digest(digest, SecretSetting.oauth.secret, data)).strip
          request.env['HTTP_X_SHOPQI_HMAC_SHA256'] = sign
          request.env['HTTP_X_SHOPQI_DOMAIN'] = shop.shopqi_domain
          request.env['RAW_POST_DATA'] = data
          post :orders_fulfilled
          response.should be_success
          Order.last.created_at.should eql created_at
        end.should change(Order, :count).by(1)
      end

    end

  end

  context 'without signature' do

    context 'orders_fulfilled' do

      it 'should be faild' do
        expect do
          request.env['x_SHOPQI_DOMAIN'] = shop.shopqi_domain
          post :orders_fulfilled, order: order
          JSON(response.body)['errors'].should eql 'Signature invalid'
        end.should_not change(Order, :count)
      end

    end

  end

end
