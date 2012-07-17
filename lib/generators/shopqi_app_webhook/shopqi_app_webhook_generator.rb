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
    insert_into_file "app/models/shop.rb", "\s\shas_many :orders\n", after: "class Shop < ActiveRecord::Base\n"
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
