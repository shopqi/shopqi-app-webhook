# encoding: UTF-8
FactoryGirl.define do
  factory :shop do
    shop_id 1
    name '测试商店'
    shopqi_domain 'myshopqi.shopqi.com'
    access_token SecureRandom.hex
  end
end
