require 'rails/generators/active_record'

class ShopQiAppWebhookGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  namespace 'shopqi_app_webhook'
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    directory 'app'
  end

  def add_routes
    route "use_shopqi_webhook"
  end

  def update_files
    prepend_to_file "app/models/shop.rb", "require \"\#{ShopQiAppWebhook::Engine.models_dir}/shop\"\n"
    insert_into_file "app/models/shop.rb", "\s\shas_many :orders\n", after: /class Shop( < ActiveRecord::Base){0,1}\n/
    insert_into_file "config/app_secret_config.yml", "\s\s\s\shost: 'lvh.me:3000'\n", after: /defaults:(.|\n|\s)+?domain:\n/
    insert_into_file "config/app_secret_config.yml", "\s\s\s\shost: 'example.shopqiapp.com'\n", after: /production:(.|\n|\s)+?domain:\n/
  end

  def install_migration
    migration_template 'db/migrate/create_orders.rb', 'db/migrate/create_orders.rb'
  end

  def show
    readme "README"
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
