require 'spec_helper'

describe Shop do

  let(:shop) { FactoryGirl.create(:shop) }

  context '#create' do

    it 'should create webhook via api' do
      stub = stub_request(:post, "myshopqi.shopqi.com/api/webhooks.json")
      with_resque do
        shop
      end
      stub.should have_been_requested
    end

  end

end
