$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopqi_app_webhook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopqi-app-webhook"
  s.version     = ShopQiAppWebhook::VERSION
  s.authors     = ["saberma"]
  s.email       = ["mahb45@gmail.com"]
  s.homepage    = "https://github.com/saberma/shopqi-app-webhook"
  s.summary     = "ShopQi app webhook engine."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "shopqi-app", "~> 0.2.5"
  s.add_dependency "delayed_job_active_record", "~> 0.3.2"

  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.10.1"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "webmock"
end
