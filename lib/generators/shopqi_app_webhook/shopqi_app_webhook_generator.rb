class ShopQiAppWebhookGenerator < Rails::Generators::NamedBase
  namespace 'shopqi_app_webhook'
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    directory 'app'
  end

  def show
    readme "README"
  end
end
