# ShopQi App Webhook Engine

新增商店用户时向 ShopQi 插入 Webhook 回调记录
接收从 ShopQi 中发送的 Webhook 事件信息

## 安装

    $ echo "gem 'shopqi-app-webhook'" >> Gemfile
    $ bundle

## 使用

此 engine 依赖 shopqi-app，使用前需要先调用 shopqi-app 的 generator

    $ rails g shopqi_app client_id client_secret
    $ rails g shopqi_app_webhook

`client_id`, `client_secret` 在注册 Application 后显示，注册时 `REDIRECT URI` 填写 localhost:3000/callback

## 配置

`app/jobs/webhook_workers.rb` 负责向 ShopQi 创建回调记录

`app/controllers/webhook_controller.rb` 负责接收和处理事件信息

## 启动

    $ rails s
    $ QUEUE=* bundle exec rake resque:work

访问 [http://localhost:3000](http://localhost:3000)
